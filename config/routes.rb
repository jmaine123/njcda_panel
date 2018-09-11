Rails.application.routes.draw do

  get 'users/new'
  get 'users/index'


  get 'courses/new'
  get 'courses/edit'
  get 'courses/index'
  get 'courses/show'

  get 'cohorts/new'
  get 'cohorts/edit'
  get 'cohorts/show'
  get 'cohorts/index'


  get 'students/new'
  get 'students/index'
  get 'students/edit'
  get 'students/show'

  resources :users

  resources :courses do
    resources :cohorts do
      resources :instructors
      resources :students
    end
  end

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/logout' => 'sessions#destroy'

  root 'pages#home'
  get 'instructors/new'
  get 'instructors/index'
  get 'instructors/edit'
  get 'instructors/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
