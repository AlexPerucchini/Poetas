class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  respond_to(:html, :js)
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
