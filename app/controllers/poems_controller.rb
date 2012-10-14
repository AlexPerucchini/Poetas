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
  end

  def create
    
  end

  def edit
  end
end
