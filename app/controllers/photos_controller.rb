class PhotosController < ApplicationController
  before_action :set_photos, only: [:show, :edit, :update, :destroy]
  before_action :get_collection, only: [:index, :update]
  before_action :authenticate_user!


  def import
    begin
      Product.import(params[:file])
      redirect_to photos_path, notice: "Products imported."
    rescue
      redirect_to photos_path, notice: "Invalid CSV file format/No file choosen"
    end
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
      if @photo.save
        redirect_to photos_path, notice: 'Photo was successfully created.'
      else
        render :new ,notice:  'Sorry we cannot add this product.'
      end
  end

  
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photos_path, notice: 'Photo was successfully updated.' }
        format.js 
      else
        format.js {  }
      end
    end
  end

  
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html {
        flash[:success] = 'Photo was successfully destroyed.'
        redirect_to photos_path
      }
      format.json { head :no_content }
    end
  end

  def get_collection
    @photos = Photo.page(params[:page]).per(6)
  end

  private
    
    def set_photos
      @photo = Photo.find(params[:id])
    end

    
    def photo_params
      params.require(:photo).permit(:title, :file)
    end
end

