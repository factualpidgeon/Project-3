Rails.application.routes.draw do

  root 'location#index'
  get 'day/:location_id/:date', to: 'day#show' 
  get 'location/past/:post_code/:date', to: 'day#show'
  get 'location/predict/:post_code/:period', to: 'location#predict'
  get 'location/predict/:lat/:lon/:period', to: 'location#predict'

  get 'weather/locations', to: 'location#index', :defaults => { :format => 'json' }
  get 'weather/data/:location_id/:date', to: 'day#show', :defaults => { :format => 'json' }
  get 'weather/data/:post_code/:date', to: 'day#show', :defaults => { :format => 'json' }
  get 'weather/prediction/:post_code/:period', to: 'location#predict', :defaults => { :format => 'json' }
  get 'weather/prediction/:lat/:long/:period', to: 'location#predict', :defaults => { :format => 'json' }

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
