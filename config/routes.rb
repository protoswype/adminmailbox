Adminmailbox::Application.routes.draw do
 
  get "sessions/new"

  match "/mailboxes/:username/edit",
    :controller => "mailboxes",
    :action => "edit",
    :constraints => { :username => /.+@.+\..*/ }
  
   match "/mailboxes/:username",
    :controller => "mailboxes",
    :action => "update",
    :constraints => { :username => /.+@.+\..*/ }
  
  
  match "/sessions/log_in",
    :controller => "sessions",
    :action => "new"
  
  match "/sessions/log_out",
    :controller => "sessions",
    :action => "destroy"
  
  resources :mailboxes
  resources :sessions
  
  root :to => 'sessions#new'
  
end
