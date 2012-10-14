class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home, :about, :contact]

  def home
  end

  def about
  end

  def contact
  end

  def profile
    @user = current_user
  end

end
