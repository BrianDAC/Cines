Rails.application.routes.draw do
  
  root 'users#index'

get "/admin" => "admin#index"
get "/employees" => "employees#index"
get "/services" => "services#index"
get "/board" => "users#board"
get "employees/reservations" => "employees#reservation"
get "employees/reservations/check" => "employees#check"
get "/movie" => "users#movie"
get "/verification" => "services#verification"
get "/details" => "billings#details"
  get "/pay" => "payments#pay"
  get "/cash" => "payments#cash"
  get "employees/ticket" => "employees#ticket"


get "/registerlogin" => "users#registerlogin"
get "message" => "users#messageregister"
get "statistics" => "statistics#index"


  post '/admin/peliculas/create'
  post '/admin/price/create'
  post 'employees/shows/create'
  post '/admin/schedules/create'
  post '/services/reservations/create'
  post '/services/purchases/create'
  post '/users/registers/create'
  post '/payments/create'

  namespace :admin do
        resources :peliculas, :price, :schedules
  end
  namespace :employees do
        resources :shows
  end

  namespace :services do
        resources :reservations, :purchases
  end

  namespace :users do
        resources :registers
  end





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
