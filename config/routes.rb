Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :deals
  resources :items do
    resources :reviews, only: [ :new, :create ]
  end
  get    "pages/about"
  get    "pages/faq"
  get    "pages/contact"
end
