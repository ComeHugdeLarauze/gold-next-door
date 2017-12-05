Rails.application.routes.draw do
  devise_for :pirates
  root to: 'pages#home'
  resources :abordages, only: [:index]

  resources :crews do
    resources :crew_pirates, only:[:create, :destroy]
  end

  resources :tresors do
    resources :abordages, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
