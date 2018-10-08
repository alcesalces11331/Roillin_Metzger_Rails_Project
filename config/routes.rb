Rails.application.routes.draw do

  # user paths #new #create
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create', as: 'users'

  get '/cats', to: 'cats#index'

  get '/spells', to: 'spells#index'
  get '/spells/sort', to: 'spells#show_by'
  get '/spells/power_level', to: 'spells#by_power_level'

  # shallow nested routing to represent model relationships with ease of view
  resources :users, only: [:show] do
    resources :cats, shallow: true do
      resources :spells, shallow: true
    end
  end

  resources :schools, only: [:show] do
    resources :spells, only: [:show], shallow: true
  end

  root 'static#welcome'
  
  # session paths
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  # omniauth path
  get '/auth/facebook/callback' => 'sessions#create'

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
