class PoemsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @user = current_user
    @poems = @user.poems
  end

  def new
    @poem = Poem.new
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def create
    
  end

  def edit
  end
end
