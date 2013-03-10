class UsersController < ApplicationController

  def index
    #gets all active poets and passes in a query sting for searching, then
    #paginates
    @poets = User.text_search(params[:query]).not_deleted.page(params[:page]).per(10)
  end

  def show
    @poet = User.find(params[:id])
    redirect_to(poems_path(id: @poet.id))
  end

  def profile
    @poet = current_user
  end
end
