Rails.application.routes.draw do
  devise_for :models
  resources :tweets

  root "tweets#index"
end
