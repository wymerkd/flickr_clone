class CommentsController < ApplicationController
  def new
    @comment = Photo.find(params[:comment_id])
    @photo = @comment.photos.new
    render :new
  end

  def create
    @comment = Photo.find(params[:comment_id])
    @photo = @comment.photos.new(photo_params)
    if @photo.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def show
  @comment = Photo.find(params[:comment_id])
  @photo = Comment.find(params[:id])
  render :show
end

def edit
  @comment = Photo.find(params[:comment_id])
  @photo = Comment.find(params[:id])
  render :edit
end

def update
  @photo = Comment.find(params[:id])
  if @photo.update(photo_params)
    redirect_to comment_path(@photo.comment)
  else
    render :edit
  end
end

def destroy
  @photo = Comment.find(params[:id])
  @photo.destroy
  redirect_to comment_path(@photo.comment)
end

  # Other controller actions go here.

  private
    def photo_params
      params.require(:photo).permit(:title, :photo_id, :user_id)
    end

end
