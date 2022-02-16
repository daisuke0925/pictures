class PhotoCommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    comment = current_user.photo_comments.new(photo_comment_params)
    comment.photo_id = @photo.id
    if comment.save
      redirect_to @photo
    else
      @error_comment = comment
      @user = @photo.user
      @photo_comment = PhotoComment.new
      render 'photos/show'
    end
  end

  def destroy
    PhotoComment.find_by(id: params[:id]).destroy
    redirect_to photo_path(params[:photo_id])
  end

  private

  def photo_comment_params
    params.require(:photo_comment).permit(:comment, :user_id, :photo_id)
  end
end
