class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
  	sign_out resource
  	new_user_session_path
  end
end