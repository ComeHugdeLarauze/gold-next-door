Rails.application.routes.draw do
  devise_for :pirates
  resources :abordages, only: [:index]
  root to: 'tresors#index'

  resources :crews do
    resources :crew_pirates, only:[:new, :create, :destroy]
    resources :crew_tresors, only:[:new, :create, :destroy]

  end

  resources :tresors do
    resources :abordages, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
