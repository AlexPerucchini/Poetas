class AdminController < ApplicationController
  before_filter(:authorize_admin)

  def show
    render(text: "Hello Admin!")
  end

  private

  def authorize_admin
    unless current_user.has_role?(:admin)
      redirect_to(root_path, alert: "You are not authorized to access this page!")
    end
  end
end
