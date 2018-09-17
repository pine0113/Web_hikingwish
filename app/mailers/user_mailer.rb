class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_plan_invites.subject
  #

  default :from => "登山許願池 <noreply@hikingwish.tw>"

  def notify_new_member(user)
    @user = user
    mail(to: @user.email,
      subject: "[登山許願池] 註冊成功！ 歡迎加入登山許願池！")
  end

  def notify_plan_member_new_invites(invite)
    @user = invite.user
    mail(to: @user.email,
         subject: "[登山許願池] 你收到了一個新的登山計畫邀請 : #{invite.plan.name} ")
  end

  def notify_plan_owner_new_apply(apply)
    @user = apply.plan.owner
    mail(to: @user.email,
         subject: "[登山許願池] 你的計畫 #{invite.plan.name} 收到了一個新的申請")
  end

  def notify_plan_member_success_apply(user, plan)
    @user = user
    @plan = plan
    mail(to: @user.email,
         subject: "[登山許願池] 成功加入登山計畫！ #{plan.name} ")
  end


end
