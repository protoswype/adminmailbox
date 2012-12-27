Adminmailbox::Application.routes.draw do
 
  resources :mailboxes
  
  root :to => 'mailboxes#index'
  
end
