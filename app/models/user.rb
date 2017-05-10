class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   after_create :welcome_send
   
   def welcome_send
      WelcomeMailer.welcome_send(self).deliver     	
   end      
end
