class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authorize_admin_user
    session[:alert] = 'You are not allowed to view that page!'
    redirect_to root_path if ! current_user.admin
  end
end
