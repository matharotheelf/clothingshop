Rails.application.routes.draw do
  resources :shop_items
  resources :basket_items
  post 'basket_items/delete', to: 'basket_items#delete'
  root 'shop_items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
