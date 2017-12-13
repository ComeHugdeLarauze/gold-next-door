Rails.application.routes.draw do
  devise_for :pirates

  resource :profile, only: [ :show, :edit, :update, :destroy]
  resources :pirates, only: :show
  resources :abordages, only: [:index]

  root to: 'tresors#index'

  resources :crews do
    resources :crew_pirates, only:[:new, :create, :destroy]
    get "pirates", to: "crews#pirates"
  end

  resources :tresors do
    resources :abordages, only: [:create, :update]
    resources :crew_tresors, only:[:new, :create, :destroy]
  end

  get "pourparlers/traques", to: "abordages#traques"
  get "pourparlers/propositions", to: "abordages#propositions"
end
