Rails.application.routes.draw do
    
    devise_for :users
    root 'home#index'
    
    get '/invite' =>  'home#invite'
    post '/invite' => 'home#create', as: :invitation_user
    
    get '/control/employees' => 'control#show_employees'
    get '/control/events' => 'control#show_events'
    get '/control/sales' => 'control#show_sales'
    get '/control/reports' => 'control#show_reports'

    get '/control/messages' => 'control#show_messages', as: :control_messages
    get '/control/messages/:id/read' => 'control/messages#mark_read', as: :control_read_message


    
    get '/sauron/groups' => 'sauron#show_groups'
    get '/sauron/groups/:id/block' => 'sauron/groups#change_status', as: :sauron_group_block
    
    get '/invitacion' => 'devise/registrations#new'
    
    get '/control/events/take/:id' => 'control/events#take', as: :control_event_take
    get '/control/events/drop/:id' => 'control/events#drop', as: :control_event_drop
    
    namespace :sauron do
        resources :groups
    end
    resources :sauron, only:[:index]
    
    namespace :control do
        resources :messages
        resources :users, only:[:create,:update,:destroy,:show, :new, :edit]
        resources :events, only:[:create,:update,:destroy,:show, :new]
        resources :sales, only:[:create,:update,:destroy,:show, :new]
    end
    resources :control, only:[:index]

    resources :home, only:[:index]
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
