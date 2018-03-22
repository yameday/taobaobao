Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  resources :posts, only: [:index, :create, :new, :edit, :update] do
    resources :replies, only: [:index, :create]
  end

  resources :users, only: [:show, :edit, :update]
end
