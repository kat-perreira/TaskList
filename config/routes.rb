Rails.application.routes.draw do
  root 'tasks#index'
    resources :tasks
    
    post '/tasks/:id/completed', to: 'books#completed', as: 'completed_task'

end
