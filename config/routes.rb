Rails.application.routes.draw do
  root to: 'categories#index'
  resources :choices
  resources :questions
  resources :exams
  resources :categories
end
