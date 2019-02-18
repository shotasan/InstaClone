Rails.application.routes.draw do
  resources :sessions, onlu:[:new,:create,:destroy]
  resources :users, only:[:new,:create,:show]
end
