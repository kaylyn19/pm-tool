Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', {to: 'home#index', as: 'root'}
  get '/about', {to: 'home#about'}

  resources :projects

  resources :projects do
    resources :tasks
    resources :discussions
  end

  resources :discussions do
    resources :comments
  end


  patch '/projects/:project_id/tasks/:id/complete', {to: 'tasks#complete', as: 'task_complete'}
end
