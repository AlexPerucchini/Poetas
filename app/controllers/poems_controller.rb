

include ActionView::Helpers::TextHelper
class PoemsController < ApplicationController

  def index
    @poet = params[:poet_id] ? User.find(params[:poet_id]) : current_user
    @poems = @poet.poems.page(params[:page]).per(10)
  end

  def new
    @poem = Poem.new
  end

  def show
    @poem = Poem.find(params[:id])
    #need to use simple_format here fot the text_analyzer to work
    @poem_text = simple_format(@poem.body)
    @ta = Poetas::TextAnalyzer.new(@poem_text)
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
