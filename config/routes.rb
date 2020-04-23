Rails.application.routes.draw do
  
  #controlers
  get 'consulta_cobertura/search'
  
  #cruds
  resources :users
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
