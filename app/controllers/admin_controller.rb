class AdminController < ApplicationController
  before_filter(:authorize_admin)
  
  def show
    render(text: "Hello Admin!")
  end
  
  private

  def authorize_admin
    if !current_user.has_role?(:admin)
      redirect_to(root_path, notice: "You are not authorized!")
    end
  end
end