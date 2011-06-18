GpaCalculator::Application.routes.draw do
  root :to => "home#index"

  get "home/index"
  get "info/faq"
  get "info/about"

  devise_for :users, :path => "accounts"

  resources :users do
    resources :courses
  end
end
