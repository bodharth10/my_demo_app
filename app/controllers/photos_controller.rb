class PhotosController < ApplicationController
  before_action :set_photos, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  def index
    @photos = Photo.page(params[:page])
  end

  def import
     Photo.import(params[:file])
       redirect_to photos_path, notice: 'Photos imported.'
  end

  
  def show
  end


  def counter
    Photo.count
  end

  
  def new
    @photo = Photo.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  
  def edit
  end

 
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_path, notice: 'Photo was successfully created.' }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        @photos = Photo.all		
        format.html { redirect_to photos_path, notice: 'Photo was successfully updated.' }
        format.js 
      else
        format.html { render :edit }
        format.js 
      end
    end
  end

  
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photo_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_photos
      @photo = Photo.find(params[:id])
    end

    
    def photo_params
      params.require(:photo).permit(:title, :file)
    end
end

