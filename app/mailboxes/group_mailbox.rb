class GroupMailbox < ApplicationMailbox
  def process
    return unless group = ::Group.find_by(email: mail.to.first)

    group.email_blasts.create!(
      subject: mail.subject,
      body: mail.body.decoded
    )
  end
end
