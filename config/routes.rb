Rails.application.routes.draw do

  get 'project/index'
  get 'project/todos'
  post 'project/createTodo'
  put 'project/completedTodo'
  root 'project#index'

  resources :project
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
