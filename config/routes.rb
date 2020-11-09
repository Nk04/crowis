Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

  root "complaints#index"
  resources :users, only: [:new, :create, :destroy]
  resources :complaints do
    collection do
      get 'search'
    end
    resources :comments, only: :create
    resources :empathies, only: [:create, :destroy]
  end
end
