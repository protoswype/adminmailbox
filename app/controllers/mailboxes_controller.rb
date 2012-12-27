class MailboxesController < ApplicationController
  
  def index
    @mailboxes = Mailbox.all
    #params[:search] ||= {}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bills }
    end
  end
  
  def new
    @mailbox = Mailbox.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailbox }
    end
  end
 
  def edit
    @mailbox = Mailbox.find(params[:id])
  end
  
  def create
    @mailbox = Mailbox.new(params[:mailbox])

    respond_to do |format|
      if @mailbox.save
        format.html { redirect_to mailboxes_url, notice: 'Mailbox was successfully created.' }
        format.json { render json: mailbox_url, status: :created, location: @mailbox }
      else
        format.html { render action: "new" }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @mailbox = Mailbox.find(params[:id])

    respond_to do |format|
      if @mailbox.update_attributes(params[:mailbox])
        format.html { redirect_to mailboxes_url, notice: 'Mailbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mailbox.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @mailbox = Mailbox.find(params[:id])
    @mailbox.destroy

    respond_to do |format|
      format.html { redirect_to mailbox_url }
      format.json { head :no_content }
    end
  end
  
end