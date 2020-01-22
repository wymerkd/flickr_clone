class HomeController < ApplicationController
  def index
    @photos = Photo.all
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    end
    :index
  end
end
