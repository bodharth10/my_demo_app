class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   after_create :welcome_send
   
	   Nu = ('0'.. '9').to_a  
	   Al =('a'..'z').to_a 
	   No = ('0'.. '9').to_a
	   
   def welcome_send
      WelcomeMailer.welcome_send(self).deliver     	
   end 

   def random_password()
    Nu.sort_by { rand }.join[0..1]  + Al.sort_by { rand }.join[0..6] + No.sort_by { rand }.join[0..1] 
   end

   def password_required?
    false
   end
end
