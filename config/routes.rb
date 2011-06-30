GpaCalculator::Application.routes.draw do
  root :to => "home#index"

  get "home/index"
  get "info/faq", :as => :faq
  get "info/about", :as => :about

  devise_for :users

  resources :users do
    resources :courses
  end
end
