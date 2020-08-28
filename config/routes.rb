Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  root "tweets#index"

 resources :tweeets do
   collection do
    post :confirm
   end
 end
end
