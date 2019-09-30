class UserMailer < ActionMailer::Base
    default :from => "no-reply@recipehound.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Recipe Hound Registration Confirmation")
 end
end
