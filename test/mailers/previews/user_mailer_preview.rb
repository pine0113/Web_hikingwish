# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/notify_plan_invites
  def notify_plan_invites
    UserMailer.notify_plan_invites
  end

end
