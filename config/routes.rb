Rails.application.routes.draw do
  root to: 'categories#index'
  resources :choices, except: %i(show)
  resources :exams, except: %i(show) do
    resources :questions
  end
  resources :categories, except: %i(show)
end
