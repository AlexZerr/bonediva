Bonediva::Application.routes.draw do
  resources :bonediva_scaffolds


  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :users do
    resources :user_categories
    resources :avatars
    resources :paintings
    resources :messages, only: [:new, :create]
    resources :carts do
      resources :cart_items
      resources :orders
    end
  end
  resources :products do
    resources :paintings
    resources :prints
    resources :print_categories
  end
  resources :carts
  resources :paintings
  resources :sessions
  resources :categories
  resources :avatars
  resources :orders
  resources :blog_posts
  resources :sold_products
  resources :messages, only: [:new, :create, :destroy]
  resources :recorders, only: [ :new ]
  resources :print_categories

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

  post '/users/:user_id/cart_items/new/:product_id', to: 'cart_items#create_print', as: 'print_to_cart'

  match '/products/:product_id/paintings/new', to: 'products#add_product_painting', as: 'add_product_painting'
  
  get  '/for_sale_paintings', to: 'products#for_sale_paintings', as: 'for_sale_products'

  post "users/:user_id/carts/:cart_id/cart_items/:id" => "cart_items#destroy", as: "destroy_cart_item"

  post "products/:id", to: "products#destroy", as: "destoy_product"
#  get "/show" => 'users#show', :as => "users"

  post "blog_posts/:id", to: "blog_posts#destroy", as: "destroy_blog_post"

  get "blog_posts/:id/bp_image", to: "blog_posts#bp_image", as: "bp_image"
#  get "users" => "users#show", :as => "users"
  get "/aceo", to: "products#aceo", as: "aceo_products"

  get "/aceo/about", to: "products#about_aceo", as: "about_aceo"
  # See how all your routes lay out with "rake routes"
  match "/products/:product_id/update_to_sold", to: "products#update_to_sold", as: "sell_product"

  match "/sold_products/:sold_product_id/revert_to_product", to: "sold_products#revert_to_product", as: "revert_to_product"

  # update product main_image
  match "products/:product_id/set_main_image/:painting_id", to: "products#set_main_image", as: "set_main_image"

  match "sold_products/:sold_product_id/set_sold_main_image/:painting_id", to: "sold_products#set_sold_main_image", as: "set_sold_main_image"
  #
  post "paintings/:id/set_as_home_image", to: "paintings#set_as_home_image", as: "set_as_home_image"

  post "paintings/:id/remove_home_image", to: "paintings#remove_home_image", as: "remove_home_image"

  match 'auth/:facebook/callback', to: 'sessions#facebook'

  match 'auth/failure', to: redirect('/')


  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
