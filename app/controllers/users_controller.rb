class UsersController < ApplicationController
  def index
    @poets = User.page(params[:page]).per(10)
  end

  def show
    @poet = User.find(params[:id])
    redirect_to( user_poems_path(@poet))
  end

  def profile
    @poet = current_user
  end
end
