Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
  get '/home/about' => 'homes#about' , as:'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
 end
end




