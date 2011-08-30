Verleih::Application.routes.draw do
  resources :searches

  devise_for :users
  resources :users
  resources :dvds

  root :to => "pages#home"
	
  match "/pages/kontakt"=>"pages#kontakt"
  match "/pages/impressum"=>"pages#impressum"
 
end
