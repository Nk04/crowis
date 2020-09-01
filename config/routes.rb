Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

  root "complaints#index"
  resources :users, only: [:new, :create, :destroy]
  resources :complaints do
    resources :comments, only: [:create]
  end
end
