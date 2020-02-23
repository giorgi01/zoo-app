Rails.application.routes.draw do
  get 'welcome/home'
  resources :animals
  get 'animals/search'
  root to: 'welcome#home'
end
