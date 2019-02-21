Rails.application.routes.draw do
  root "users#new" 
  resources :sessions, onlu:[:new,:create,:destroy]
  resources :users, only:[:new,:create,:show,:edit,:update]
  resources :favorites, only:[:index,:create,:destroy]
  resources :posts do
    collection do
      post 'confirm'
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
