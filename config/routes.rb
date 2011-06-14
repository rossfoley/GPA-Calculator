GpaCalculator::Application.routes.draw do
  root :to => "home#index"

  get "home/index"

  devise_for :users

  resources :users do
    resources :courses
  end
end
