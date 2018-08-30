Rails.application.routes.draw do
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

  resources :instructors
  resources :students
  resources :cohorts
  resources :courses

  root 'pages#home'
  get 'instructors/new'
  get 'instructors/index'
  get 'instructors/edit'
  get 'instructors/show'

  get 'pages/settings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
