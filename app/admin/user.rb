ActiveAdmin.register User do
	permit_params :email, :password, :password_confirmation
	#permit_params :email,:encrypted_password, :reset_password_token, :reset_password_sent_at, :reset_password_sent_at, :reset_password_sent_at, :reset_password_sent_at, :reset_password_sent_at, :remember_created_at, :remember_created_at, :remember_created_at, :remember_created_at, :remember_created_at, :current_sign_in_at, :current_sign_in_at, :current_sign_in_at, :current_sign_in_at, :current_sign_in_at, :last_sign_in_at, :last_sign_in_at, :last_sign_in_at, :last_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  column :email
  column :password
  actions

end

form do |f|
   f.inputs do
     f.input :email
     f.input :password
     f.input :password_confirmation
   end
   f.actions
  end

end

 