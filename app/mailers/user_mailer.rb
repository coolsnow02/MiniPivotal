class UserMailer < ActionMailer::Base
  default from: "pansingh@weboniselab.com"

  def welcome_email(user)
    @user = user
    @url = "http://local.minipivotal.com/"
    mail(:to => user, :subject => "MiniPivotal - You have been invited to a new Project")
  end

  def new_user_email(user)
    @user = user
    @url = "http://local.minipivotal.com/"
    mail(:to => @user.email, :subject => "MiniPivotal - You have been invited to a new Project")
  end

end
