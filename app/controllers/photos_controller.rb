class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_comment = PhotoComment.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to photos_path, notice: 'You have created book successfully.'
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :body, :user_id, :image)
  end
end
