Rails.application.routes.draw do
  resources :animals
  get 'animals/search'
  root to: 'animals#index'
end
