Rails.application.routes.draw do
  root to: 'categories#index'
  resources :exams do
    resources :questions do
      get 'next', to: 'questions#next'
    end
  end
  resources :categories, except: %i(show)
end
