class Api::V1::UsersController < ApplicationController
   respond_to :json
   skip_before_action :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
   before_action :authenticate_request!

		  def create
		   user = User.new(user_params) 
			   if user.save 
			      render :json => { :status => 'success', :user => user.as_json() ,:message => 'user saved successfully' ,:code => '200'}
			   else
			     render json: { errors: user.errors}, status: 500 , message: 'failed'
			   end
		  end

		  def show
		  	user = User.find(params[:id])
		    render :json => { :status => 'success', :user => user.as_json() ,:message => 'user fetched successfully' ,:code => '200'}
		  end

		  def update
		   user = User.find(params[:id])
		    if user.update(user_params)
			      render :json => { :status => 'success', :user => user.as_json() ,:message => 'user updated successfully' ,:code => '200'}
			    else
			      render json: { errors: user.errors }, status: 500
			    end
		  end

		  def destroy
		    user = User.find(params[:id])
		     if user.destroy
		        render :json => { :status => 'success',:message => 'user deleted successfully' ,:code => '200'}
		      else
			      render json: { errors: user.errors }, status: 500
			    end   
		  end

		  private

		  def user_params
		   params.permit(:email, :password, :password_confirmation)
		  end
end
