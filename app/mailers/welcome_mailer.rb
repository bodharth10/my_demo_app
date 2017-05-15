class WelcomeMailer < ApplicationMailer

 def welcome_send(user)
 	@user = user
 	@password = user.random_password
 	user.update(password: @password)
 	mail to: user.email, subject: "welcome to my gallery" , from: "bodharth@maropost.com"        	
 end   
end
