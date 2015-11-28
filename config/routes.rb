Rails.application.routes.draw do
  root to: 'categories#index'
  resources :exams do
    resources :questions
  end
  resources :categories, except: %i(show)
end
