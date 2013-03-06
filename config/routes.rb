NKnet::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'pages#main'
  
  constraints :id => /\d+/ do
  
    post    '/users' => 'users#create', :as => 'users'
    get     '/users/:id' => 'users#show', :as => 'user'
    get     '/users/:id/edit' => 'users#edit', :as => 'user_edit'
    get     '/users/:id/posts' => 'users#posts', :as => 'user_posts'
    get     '/users/:id/pictures' => 'users#pictures', :as => 'user_pictures'
    put     '/users/:id/status' => 'users#update_status', :as => 'user_status'
    put     '/users/:id/role' => 'users#update_role', :as => 'user_role'
    put     '/users/:id/password' => 'users#update_password', :as => 'user_password'
    
    get     '/posts' => 'posts#index', :as => 'posts'
    post    '/posts' => 'posts#create'
    get     '/posts/:id' => 'posts#show', :as => 'post'
    delete  '/posts/:id' => 'posts#destroy'
    
    get     '/pictures' => 'pictures#index', :as => 'pictures'
    post    '/pictures' => 'pictures#create'
    get     '/pictures/:id' => 'pictures#show', :as => 'picture'
    delete  '/pictures/:id' => 'pictures#destroy'
    
    get     '/tags' => 'tags#index', :as => 'tags'
    post    '/tags' => 'tags#create'
    get     '/tags/:id' => 'tags#show', :as => 'tag'
    put     '/tags/:id' => 'tags#update'
    delete  '/tags/:id' => 'tags#destroy'
    
    post    '/taggings' => 'taggings#create', :as => 'taggings'
    delete  '/taggings/:id' => 'taggings#destroy', :as => 'tagging'

    post    '/comments' => 'comments#create', :as => 'comments'
    delete  '/comments/:id' => 'comments#destroy', :as => 'comment'
    
    post    '/user_sessions' => 'user_sessions#create', :as => 'user_sessions'
    delete  '/user_sessions' => 'user_sessions#destroy'
  
  end
end
