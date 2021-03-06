class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :full_name, :last_name_kana, :first_name_kana, :profile_image)
  end
end
