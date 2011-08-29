Verleih::Application.routes.draw do
  get "users/index"

  get "users/show"

  devise_for :users

  resources :dvds

  root :to => "pages#home"
	
  match "/pages/kontakt"=>"pages#kontakt"
  match "/pages/impressum"=>"pages#impressum"
 
end
