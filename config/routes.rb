NKnet::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'pages#main'
  
  post    '/users' => 'users#create', :as => 'users'
  get     '/users/:id' => 'users#show', :as => 'user'
  put     '/users/:id' => 'users#update'
  
  get     '/posts' => 'posts#index', :as => 'posts'
  post    '/posts' => 'posts#create'
  get     '/posts/:id' => 'posts#show', :as => 'post'
  delete  '/posts/:id' => 'posts#destroy'
  
  get     '/pictures' => 'pictures#index', :as => 'pictures'
  post    '/pictures' => 'pictures#create'
  get     '/pictures/:id' => 'pictures#show', :as => 'picture'
  delete  '/pictures/:id' => 'pictures#destroy'
  
  post    '/tags' => 'tags#create', :as => 'tags'
  put     '/tags/:id' => 'tags#update', :as => 'tag'
  delete  '/tags/:id' => 'tags#destroy'
  
  post    '/taggings' => 'taggings#create', :as => 'taggings'
  delete  '/taggings/:id' => 'taggings#destroy', :as => 'tagging'

  post    '/comments' => 'comments#create', :as => 'comments'
  delete  '/comments/:id' => 'comments#destroy', :as => 'comment'
  
  post    '/user_sessions' => 'user_sessions#create', :as => 'user_sessions'
  delete  '/user_sessions' => 'user_sessions#destroy'
  
end
