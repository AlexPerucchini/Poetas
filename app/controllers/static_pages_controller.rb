class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about, :contact]

  def home
    @poems_count = Poem.count
    @poets_count = User.count
    @latest_poet = User.where("created_at > ?", Time.zone.now - 1.hour).last
  end

  def about
  end

  def contact
  end

end
