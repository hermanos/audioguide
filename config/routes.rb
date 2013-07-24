AudioguideMuseum::Application.routes.draw do
  get 'search' => 'exhibits#search'

  resources :qr_codes


  devise_for :users

  resources :museums do
    get 'activate', on: :member
    get 'deactivate', on: :member
    resources :exhibits
  end

  resources :profiles
  resources :comments
  resources :ratings
  resources :achievements

  get "pages/index", as:"index"
  get "pages/test"

  root :to => 'pages#index'
end
