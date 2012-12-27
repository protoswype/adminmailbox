class MailboxesController < ApplicationController
  
  before_filter :authenticate_user
  
  def index
    @mailbox = Mailbox.first
    #params[:search] ||= {}

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def new
    @mailbox = Mailbox.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
 
  def edit
    @mailbox = Mailbox.find(params[:username])
  end
  
  def create
    @mailbox = Mailbox.new(params[:mailbox])

    respond_to do |format|
      if @mailbox.save
        format.html { redirect_to mailboxes_url, notice: 'Mailbox was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def update
    @mailbox = Mailbox.find(params[:username])

    respond_to do |format|
      if @mailbox.update_attributes(params[:mailbox])
        format.html { redirect_to mailboxes_url, notice: 'Mailbox was successfully updated.' }
       # format.html { redirect_to :controller => "mailboxes", :action => "edit", :notice => 'Mailbox was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @mailbox = Mailbox.find(params[:username])
    @mailbox.destroy

    respond_to do |format|
      format.html { redirect_to mailbox_url }
    end
  end
  
end