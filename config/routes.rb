Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', {to: 'home#index', as: 'root'}
  get '/about', {to: 'home#about'}
  get '/my_favourites', {to: 'home#favourites', as: 'my_favourites'}

  resources :projects

  resources :projects do
    resources :tasks
    resources :discussions
  end

  resources :discussions do
    resources :comments
  end

  patch '/projects/:project_id/tasks/:id/complete', {to: 'tasks#complete', as: 'task_complete'}

  resources :users, only: [:new, :create, :edit, :update]
  get '/users/:id/edit_password', {to:"users#edit_password", as: :edit_user_password}
  # patch '/users/:id/update_password', {to: 'users#update_password', as: :user_password}
  resource :sessions, only: [:new, :create, :destroy]

  resources :projects do
    resources :favourites, only: [:create, :destroy]
  end

  post 'password/forgot', {to: 'password#forgot', as: :forgot_password}
  post 'password/reset', {to: 'password#reset', as: :reset_password}
end
