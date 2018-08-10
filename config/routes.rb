Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "cocktails#index"
  resources :cocktails, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :doses, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end

  post '/query' => 'cocktails#search'
end
