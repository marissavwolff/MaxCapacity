Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :projects
  resources :members

  get "about_us", to: "pages#about_us", as: :about_us
  get 'demo', to: 'pages#demo', as: :demo
  get 'pricing', to: 'pages#pricing', as: :pricing
  get 'contact_us', to: 'pages#contact_us', as: :contact_us
  # get 'sign_up', to: 'registrations#new', as: :new_user_registration

end
