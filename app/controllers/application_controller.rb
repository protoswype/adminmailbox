class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def current_user
    @current_user ||= Mailbox.find(session[:username]) if session[:username]
  end
end
