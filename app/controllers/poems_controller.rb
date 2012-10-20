class PoemsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @user = current_user 
     @poems = @user.poems.page(params[:page]).per(10)
  end

  def show_poems
    @user_id = User.find(params[:id])
    @poems = @user.poems.page(params[:page]).per(10)
    render('show')
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
    @poem = Poem.find(params[:id])
  end

  def update 
    @poem = Poem.find(params[:id])
    
    if @poem.update_attributes(params[:poem])
      redirect_to(@poem, :notice => 'Your poem was successfully updated.') 
    else
      render('edit')
    end
  end

  def destroy
    #make sure it's the correct user
    @poem = current_user.poems.find(params[:id])
    @poem.destroy
    redirect_to(poems_url)
  end
  
end
