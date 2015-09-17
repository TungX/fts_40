Rails.application.routes.draw do
  devise_for :users
  root "exams#index"
  get "help" => "static_pages#help"
  namespace :admin do
    root "categories#index"
    resources :categories
    resources :questions
    resources :exams
  end
  resources :users do
    resources :questions
  end
  resources :exams
end
