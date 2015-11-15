Rails.application.routes.draw do

  # Beer O' Dex routes
  get '/beerodex/new' => "beerodex#new"
  get '/beerodex' => "beerodex#index"
  get '/beerodex/show' => "beerodex#show"
  post '/beerodex/create' => "beerodex#create"

  # Beers routes
  get '/admin/beers' => "beer#index"
  get '/admin/beers/new' => "beer#new"
  post '/admin/beers/create' => "beer#create"
  get '/admin/beers/:id' => "beer#show"
  get '/admin/beers/:id/edit' => "beer#edit"
  patch '/admin/beers/:id' => "beer#update"
  delete '/admin/beers/:id' => "beer#destroy"
  get '/admin/unregistered-beer/' => "beer#unregistered_beer"
  get '/admin/unregistered-beer/:id' => "beer#add_unregistered_beer"
  post '/admin/create-unregistered-beer/:id' => "beer#create_unregistered_beer"
  delete '/admin/destroy-unregistered-beer/:id' => "beer#destroy_unregistered_beer"

  # Admin Users routes
  get '/admin/users' => "users#index"
  get '/admin/users/:id' => "users#show"
  get '/admin/users/:id/edit' => "users#edit"
  patch '/admin/users/:id' => "users#update"
  delete '/admin/users/destroy' => "users#destroy"

  devise_for :users
  get '/users/avatar' => "home#avatar"
  patch '/users/avatar/create' => "home#create_avatar"
  get 'home/index'

  root to: "home#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
