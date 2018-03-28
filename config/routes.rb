Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"

  resources :posts, only: [:index, :create, :new, :show, :edit, :update] do
    resources :replies, only: [:index, :create]

    get :ranking

    member do
      post :participate
      post :unparticipate
    end
  end

  resources :users, only: [:show, :edit, :update]
end
