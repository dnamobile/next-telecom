Rails.application.routes.draw do
  get 'users/index'
  get 'consulta_cobertura/search'
  resources :locals
  resources :coberturas
  resources :enderecos
  resources :estados
  resources :logradouros
  resources :bairros
  resources :cidades
  
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index' 
  get 'home' => 'home#index'

end
