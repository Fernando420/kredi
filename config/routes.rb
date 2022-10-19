Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :invoices do
    collection do
      get :new_massive
      post :create_massive
      get 'qr/:id' => 'invoices#qr', as: :qr
    end
  end
  resources :emitters
  resources :receivers
  resources :zip_files
end
