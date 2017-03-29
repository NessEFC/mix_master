Rails.application.routes.draw do
  resources :artists, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
