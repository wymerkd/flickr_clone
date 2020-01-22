class TagsController < ApplicationController
  def new
    @tag = Photo.find(params[:tag_id])
    @photo = @tag.photos.new
    render :new
  end

  def create
    @tag = Photo.find(params[:tag_id])
    @photo = @tag.photos.new(photo_params)
    if @photo.save
      redirect_to tag_path(@tag)
    else
      render :new
    end
  end

  def show
  @tag = Photo.find(params[:tag_id])
  @photo = Tag.find(params[:id])
  render :show
end

def edit
  @tag = Photo.find(params[:tag_id])
  @photo = Tag.find(params[:id])
  render :edit
end

def update
  @photo = Tag.find(params[:id])
  if @photo.update(photo_params)
    redirect_to tag_path(@photo.tag)
  else
    render :edit
  end
end

def destroy
  @photo = Tag.find(params[:id])
  @photo.destroy
  redirect_to tag_path(@photo.tag)
end

  # Other controller actions go here.

  private
    def photo_params
      params.require(:photo).permit(:title, :photo_id, :user_id)
    end

end
