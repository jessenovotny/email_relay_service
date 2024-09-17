class GroupMailbox < ApplicationMailbox
  def process
    # Find the group by email address
    return unless group = EmailGroup.find_by(group_address: mail.to.first)

    group.email_blasts.create!(
      subject: mail.subject,
      body: mail.body.decoded
    )

    # Send the email to all group members using ActionMailer
    group.users.each do |user|
      GroupMailer.with(email_address: user.email_address, original_email: mail).forward.deliver_later
    end
  end
end
