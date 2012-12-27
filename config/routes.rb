Adminmailbox::Application.routes.draw do
 
  match "/mailboxes/:username/edit",
    :controller => "mailboxes",
    :action => "edit",
    :constraints => { :username => /.+@.+\..*/ }
  
  resources :mailboxes
  
  root :to => 'mailboxes#index'
  
end
