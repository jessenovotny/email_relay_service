class GroupMailer < ApplicationMailer
  default from: "admin@mailprotector.com"

  def forward_email
    @email = params[:email]
    mail(to: @email.user.email, subject: @email.subject, body: @email.body)
  end
end
