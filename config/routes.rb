Rails.application.routes.draw do
  get 'pages/home'
  resources :animals
  get 'search', to: 'animals#search', as: 'search'
  post 'search', to: 'animals#result'
  root to: 'pages#home'
end
