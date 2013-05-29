Bonediva::Application.routes.draw do
  resources :bonediva_scaffolds


  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :users do
    resources :avatars
    resources :carts do
      resources :cart_items
      resources :orders
    end
  end
  resources :products do
    resources :paintings
  end
  resources :paintings
  resources :sessions
  resources :categories
  resources :avatars
  resources :orders
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'main#index'

  match '/index', :to => 'main#index'

  get '/about', :to => 'main#about'
  
  get "log_in" => "sessions#new", :as => "log_in"
  
  get "log_out" => "sessions#destroy", :as => "log_out"

  post '/categories/:id/update_featured_painting/:painting_id', to: 'categories#update_featured_painting', as: 'update_featured_painting'
  
  match '/products/:product_id/paintings/new', to: 'paintings#add_product_painting', as: 'add_product_painting'

  post '/users/:user_id/carts/:cart_id/cart_items/new/:product_id', to: 'cart_items#create', as: 'add_cart_item'

  match '/products/:product_id/paintings/new', to: 'products#add_product_painting', as: 'add_product_painting'
#  get "/show" => 'users#show', :as => "users"

#  get "users" => "users#show", :as => "users"


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
