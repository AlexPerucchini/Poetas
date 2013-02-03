class UsersController < ApplicationController

  def index
    #@poets = User.not_deleted.page(params[:page]).per(10)

    @search = User.search do
      fulltext params[:search]
      paginate :page => params[:page], :per_page => 10
    end

   @poets = @search.results
  end

  def show
    @poet = User.find(params[:id])
    redirect_to(poems_path(id: @poet.id))
  end

  def profile
    @poet = current_user
  end
end
