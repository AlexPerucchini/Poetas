class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about, :contact]

  def home
    @poems_count = Poem.count
    @poets_count = User.count
    @latest_poet = User.last
    @featured_poem = Poem.last
  end

  def about
  end

  def contact
  end

end
