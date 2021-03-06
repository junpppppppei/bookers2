Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top',as: 'home'
  get 'home/about' => 'homes#about',as: 'about'
  resources :books,only: [:create,:index,:show,:edit,:update,:destroy]
  resources :users,only: [:index,:edit,:update,:show]
end
