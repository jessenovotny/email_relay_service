class Email < ApplicationRecord
  belongs_to :user
  belongs_to :email_blast

  def deliver_email
    GroupMailer.with(email: self).forward_email.deliver_later
  end
end
