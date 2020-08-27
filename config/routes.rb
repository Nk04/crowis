Rails.application.routes.draw do
  root "complaints#index"
  resources :complaints, only: :index
end
