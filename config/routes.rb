Rails.application.routes.draw do
  resources :cocktails, only: [:index, :show, :create, :destroy] do 
    resources :doses, only: [:new, :create, :destroy], shallow: true
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
