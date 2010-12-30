BadgerBadger::Application.routes.draw do

  root :to => "home#index"
  
  devise_for :users
  
  resources :badges do
    member do
      get 'badge_image'
    end
  end
  resources :pins
  
end
