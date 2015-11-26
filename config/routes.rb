Rails.application.routes.draw do
  root to: 'categories#index'
  resources :choices, except: %i(show)
  resources :questions
  resources :exams, except: %i(show)
  resources :categories, except: %i(show)
end
