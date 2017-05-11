class PhotosController < ApplicationController
  before_action :set_photos, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  def index
    @photos = Photo.page(params[:page])
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @photo = Photo.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_path, notice: 'Photo was successfully created.' }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
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

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photo_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photos
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :file)
    end
end

