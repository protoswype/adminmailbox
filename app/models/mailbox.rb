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
  
end