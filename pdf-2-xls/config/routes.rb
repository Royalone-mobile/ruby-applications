require 'constants'
#Created by : Ksolves 
#Created at : 27-Aug-2014
Trap::Application.routes.draw do
 
  match "/#{DEFAULT_URL}" => 'trap#index' ,via: [:get, :post]
  match "/#{DEFAULT_URL}/:id" => 'trap#show' ,via: [:get, :post]
  match "/#{DEFAULT_URL}/:id/requests/:request_id" => 'trap#show_request_details' ,via: [:get, :post]
  match "/#{DEFAULT_URL}/:id/requests" => 'trap#show_request' ,via: [:get, :post]
  get '/trap/welcome'
  root 'trap#welcome'


  get "pdf_to_xls/index"
  get "pdf_to_xls/show"
  get "pdf_to_xls/present"
  post "pdf_to_xls/index"
  post "pdf_to_xls/show"
  post "pdf_to_xls/present"
  post "pdf_to_xls/change_page"
  post "pdf_to_xls/show_selected"
  match "/error" =>"pdf_to_xls#error" , via: [:get, :post]
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
