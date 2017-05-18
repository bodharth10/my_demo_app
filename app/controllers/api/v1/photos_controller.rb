class Api::V1::PhotosController < ApplicationController
   respond_to :json
   skip_before_action :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
   before_action :authenticate_request!


   def index
    photos = Photo.all
	    respond_to do |format|
	      format.json { render json: photos }
	    end
   end

		  def create
		   photo = Photo.new(photo_params) 
			   if photo.save 
			     render json: photo, status: 201
			   else
			     render json: { errors: photo.errors}, status: 422
			   end
		  end

		  def show
		    respond_with Photo.find(params[:id])
		  end

		  def update
		    photo = Photo.find(params[:id])

		    if photo.update(photo_params)
		      render json: photo, status: 200
		    else
		      render json: { errors: photo.errors }, status: 422
		    end
		  end

		  def destroy
		    photo = Photo.find(params[:id])
		    photo.destroy
		    head 204
		  end

		  private

		  def photo_params
		   params.require(:photo).permit(:title, :file)
		  end
end