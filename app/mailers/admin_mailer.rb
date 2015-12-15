class AdminMailer < ApplicationMailer
  def new_user(user)
    @user = user
    mail subject: "new user: #{user.email}"
  end
end
