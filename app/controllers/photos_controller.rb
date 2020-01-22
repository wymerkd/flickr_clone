class PhotosController < ApplicationController

  def index
    @photos = Photo.all
    render :index
  end

  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  @user = User.find(params[:user_id])
  @photo = Photo.find(params[:id])
  render :show
end

def edit
  @user = User.find(params[:user_id])
  @photo = Photo.find(params[:id])
  render :edit
end

def update
  @photo = Photo.find(params[:id])
  if @photo.update(photo_params)
    redirect_to user_path(@photo.user)
  else
    render :edit
  end
end

def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy
  redirect_to user_path(@photo.user)
end

  # Other controller actions go here.

  private
    def photo_params
      params.require(:photo).permit(:title, :user_id)
    end

end
