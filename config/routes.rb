Rails.application.routes.draw do

  get 'project' => 'project#index'
  post 'project/createTodo' => 'project#createTodo'
  post 'project/completedTodo' => 'project#completedTodo'
  root 'project#index'

  resources :project
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
