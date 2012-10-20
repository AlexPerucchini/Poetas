class UsersController < ApplicationController
  def index
    @poets = User.page(params[:page]).per(10)
  end

  def show
    @poet = User.find(params[:id])
    redirect_to( poems_path(id: @poet.id) )
  end

  def profile
    @poet = current_user
  end
end
