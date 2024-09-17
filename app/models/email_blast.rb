class EmailBlast < ApplicationRecord
  belongs_to :group
  has_many :emails

  after_commit :distribute

  private

  def distribute
    group.users.each do |user|
      Email.create!(
        subject: subject,
        body: body,
        user: user,
        email_blast: self
      ).deliver_email
    end
  end
end
