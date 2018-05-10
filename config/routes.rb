Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles
  resources :polls
  resources :votes, only: [:create]


  resources :article_categories
  get 'products/:id', to: 'products#show', :as => :products
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  root :to => 'visitors#index'
end
