class SessionsController < ApplicationController
  def create
    # username with password correct?
    mailbox = Mailbox.authenticate(params[:username], params[:password])
    if mailbox
      # create session
      session[:username] = mailbox.username
      redirect_to :controller => "mailboxes", :action => "index", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_url, :notice => "Logged out!"
  end



end
