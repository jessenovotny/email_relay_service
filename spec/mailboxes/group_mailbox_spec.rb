require 'rails_helper'

RSpec.describe GroupMailbox, type: :mailbox do
  let!(:group) { create(:group, email_address: "group@test.com") }

  let(:mail) do
    Mail.new(
      to: "group@test.com",
      from: "sender@example.com",
      subject: "Test Subject",
      body: "This is the body of the test email."
    )
  end

  before do
    # Simulate receiving the email
    inbound_email = create_inbound_email_from_message(mail)
    receive_inbound_email(inbound_email)
  end

  context 'when a matching group is found' do
    it 'creates an EmailBlast' do
      expect(EmailBlast.count).to eq(1)
    end

    it 'creates an EmailBlast with the correct subject and body' do
      email_blast = EmailBlast.last
      expect(email_blast.subject).to eq("Test Subject")
      expect(email_blast.body).to eq("This is the body of the test email.")
    end

    it 'associates the EmailBlast with the correct group' do
      email_blast = EmailBlast.last
      expect(email_blast.group).to eq(group)
    end
  end

  context 'when no matching group is found' do
    let!(:group) { create(:group, email_address: "othergroup@test.com") }

    it 'does not create an EmailBlast' do
      expect(EmailBlast.count).to eq(0)
    end
  end
end
