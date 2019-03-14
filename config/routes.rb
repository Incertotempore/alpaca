Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :deals
  resources :items do
    resources :reviews, only: [ :new, :create ]
  end
  get    "about", to: "pages#about"
  get    "faq", to: "pages#faq"
  get    "contact", to: "pages#contact"

  get    "my_items", to: "items#my_items"

  get    "items/:item_id/new_deal", to: "deals#new", as: "deal_new"
  get    "deals/:id/success", to: "deals#success", as: "deal_success"
end
