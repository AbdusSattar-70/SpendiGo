Rails.application.routes.draw do
  devise_for :users
  resources :categories do
  resources :deals
  end
end
