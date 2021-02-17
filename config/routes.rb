Rails.application.routes.draw do
  root :to => "pages#home"
  resources :users, except: [:new]
  resources :items
  # resources :items do
  #   collection do
  #     get :index
  #     post :create
  #   end
  #   member do
  #     get :new
  #     get :show
  #     put :update
  #     delete :destroy
  #   end
  #end
  resources :categories
  get 'signup', to: 'users#new'
  #post 'users', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :orders
  
end
