Rails.application.routes.draw do
  get 'report/month'
  post 'report/month'


  get 'report/year'
  post 'report/year'

  resources :employees
  resources :accounts do
    get  :add_comp,        on: :member
    post :add_comp,        on: :member
    post :add_comp_result, on: :member
  end

  devise_for :users, :skip => [:registrations]

  resources :projects
  resources :members
  resources :type_ioes
  resources :ioes
  resources :comps
  resources :transactions
  resources :users
  resources :budgets
  resources :roles


  resources :bills do
    get  :confirm, on: :member
    get  :pay,     on: :member
    post :pay,     on: :member
    get  :err,     on: :member
    get  :hold,    on: :member
  end

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end


  get '/users' => 'users#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'bills#index'

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