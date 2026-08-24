Rails.application.routes.draw do
  devise_for :usuarios

  get "admin", to: "admin#index", as: :admin_panel
  
  # Gestión de usuarios
  resources :usuarios, only: [:index, :edit, :update, :destroy]

  resources :recursos
  resources :prestamos do
    member do
      patch :finalizar
    end
  end

  root to: "pages#home"
end