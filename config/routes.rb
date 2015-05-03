Rails.application.routes.draw do
  get 'accounts/update'

  get 'accounts/show'

  get 'accounts/edit'
  
  get 'todoitems/index'

  get 'todoitems/new'
  
  get 'todoitems/create'

  get 'todoitems/show'

  get 'todoitems/edit'

  get 'todoitems/update'

  get 'todoitems/destroy'

  get 'todoitems/update_done'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :accounts, only: [:show, :edit, :update]

  resources :todolists
  root to: "todolists#index"

  # resources :todolists do
  #   resources :todoitems do
  #     member do
  #       put :update_done
  #     end    
  #   end 
  # end

  resources :todoitems, :update_done

  resources :todolists do
    resources :todoitems, only: [:new, :show, :edit, :update, :create, :destroy]
  end

  resources :sessions, only: [:create, :destroy, :new]

  get '/login' => "sessions#new", as: "login"
  delete '/logout' => "sessions#destroy", as: "logout"

end