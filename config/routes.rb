Rails.application.routes.draw do
  resources :choices
  resources :questions
  resources :exams
  resources :categories
end
