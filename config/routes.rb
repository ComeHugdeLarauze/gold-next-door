Rails.application.routes.draw do
  devise_for :pirates
  root to: 'tresors#index'

  resources :crews do
    resources :crew_pirates, only:[:new, :create, :destroy]

  end

  resources :tresors do
    resources :abordages, only: [:create, :update]
    resources :crew_tresors, only:[:new, :create, :destroy]
  end

  get "pourparlers/traques", to: "abordages#traques"
  get "pourparlers/propositions", to: "abordages#propositions"
end
