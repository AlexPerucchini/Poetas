class PoemsController < ApplicationController
  
  def index
    #FIXME: refactor
    if params[:id].nil? && current_user && signed_in?
      @poet = current_user 
      @poems = @poet.poems.page(params[:page]).per(10)
    else
      @poet = User.find(params[:id])
      @poems = @poet.poems.page(params[:page]).per(10)
    end    
  end

  def new
    @poem = Poem.new
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def create
    @poet = current_user
    @poem = @poet.poems.create(params[:poem])

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

  private
  
end
