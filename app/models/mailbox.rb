class Mailbox < ActiveRecord::Base
  
  set_primary_key :username
  
  attr_accessible :username, :password, :name, :maildir, :quota, :local_part, :domain, :created, :modified, :active
  
  # table name is not plural
  set_table_name "mailbox"
  
  # Filers
  before_create :hash_password
  
  require 'digest/md5'
  
  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
    

  def self.authenticate(username, password)
    mailbox = find_by_username(username)
    if username == ""
      nil
    else
      if mailbox.password == Digest::MD5.hexdigest(password)
        mailbox
      else
        nil
      end    
    end
    
  end
end