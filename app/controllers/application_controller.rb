class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def current_user
    @current_user ||= Mailbox.find(session[:username]) if session[:username]
  end
  
  def authenticate_user
    unless current_user
      redirect_to :controller => "sessions", :action => "new"
      flash[:not_signed_in] = "You need to sign in order to see this page!"
    end
  end
end
