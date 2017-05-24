class Api::V1::PhotosController < ApplicationController
   respond_to :json
   skip_before_action :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
   before_action :authenticate_request!


   def index
    photos = Photo.all
	      render :json => { :status => 'success', :photo => photos.as_json() ,:message => 'record fetched successfully' ,:code => '200'}
   end

		  def create
		   photo = Photo.new(photo_params) 
			   if photo.save 
			     render :json => { :status => 'success', :photo => photo.as_json() ,:message => 'photo saved successfully' ,:code => '200'}
			   else
			     render json: { errors: photo.errors}, status: 422 , message: 'failed'
			   end
		  end

		  def show
		  	 photo = Photo.find(params[:id])
			    render :json => { :status => 'success', :photo => photo.as_json() ,:message => 'photo fetched successfully' ,:code => '200'}
		  end

		  def update
		    photo = Photo.find(params[:id])
			    if photo.update(photo_params)
			      render :json => { :status => 'success', :photo => photo.as_json() ,:message => 'photo updated successfully' ,:code => '200'}
			    else
			      render json: { errors: photo.errors }, status: 500
			    end
		  end

		  def destroy
		    photo = Photo.find(params[:id])
		     if photo.destroy
		        render :json => { :status => 'success',:message => 'photo deleted successfully' ,:code => '201'}
		      else
			      render json: { errors: photo.errors }, status: 500
			    end   
		  end

		  private

		  def photo_params
		   params.require(:photo).permit(:title, :file)
		  end
end