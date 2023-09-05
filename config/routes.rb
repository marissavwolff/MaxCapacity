Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :projects

  get "about_us", to: "pages#about_us", as: :about_us
end
