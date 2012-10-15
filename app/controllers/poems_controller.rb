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
    @user = current_user
    @poem = @user.poems.create(params[:poem])

    if @poem.save
      redirect_to(@poem, notice =>'Your poem was successfully created.')
    else
      render('new')
    end
  end

  def edit
  end
end
