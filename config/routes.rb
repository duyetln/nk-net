NKnet::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  
  post    '/users' => 'users#create'
  get     '/users/:id' => 'users#show'
  put     '/users/:id' => 'users#update'
  
  get     '/posts' => 'posts#index'
  post    '/posts' => 'posts#create'
  get     '/posts/:id' => 'posts#show'
  delete  '/posts/:id' => 'posts#destroy'
  
  get     '/pictures' => 'pictures#index'
  post    '/pictures' => 'pictures#create'
  get     '/pictures/:id' => 'pictures#show'
  delete  '/pictures/:id' => 'pictures#destroy'
  
  post    '/tags' => 'tags#create'
  put     '/tags/:id' => 'tags#update'
  delete  'tags/:id' => 'tags#destroy'
  
  post    '/taggings' => 'taggings#create'
  delete  '/taggings/:id' => 'taggings#destroy'

  post    '/comments' => 'comments#create'
  delete  '/comments' => 'comments#destroy'
  
  post    '/user_sessions' => 'user_sessions#create'
  delete  '/user_sessions' => 'user_sessions#destroy'
  
end
