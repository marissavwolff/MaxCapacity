Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :projects do
    get "new_tool", to: "projects#new_tool", as: :new_tool
  end
  resources :members

  get "about_us", to: "pages#about_us", as: :about_us
end
