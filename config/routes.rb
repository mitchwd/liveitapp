Liveitapp::Application.routes.draw do
  
  resources :tasks

  resources :entries
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect("/")
  match 'signout', to: 'sessions#destroy', as: 'signout'
  
  match 'entries/:id/liveit', to: 'tasks#create', as: 'liveit'
  match 'today', to: 'entries#today', as: 'today'
  
  root :to => 'entries#today'
end
