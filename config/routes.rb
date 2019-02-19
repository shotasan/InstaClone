Rails.application.routes.draw do
  resources :sessions, onlu:[:new,:create,:destroy]
  resources :users, only:[:new,:create,:show]
  resources :posts
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
