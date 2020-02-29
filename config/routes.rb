Rails.application.routes.draw do
  resources :burgers
  get 'burgers' => 'burger#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
