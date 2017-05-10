class WelcomeMailer < ApplicationMailer

 def welcome_send(user)
 	@user = user
 	mail to: user.email, subject: "welcome to my gallery" , from: "bodharth@maropost.com"        	
 end   
end
