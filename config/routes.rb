Rails.application.routes.draw do

  namespace :admin do
    get 'timeslots/new'
    get 'timeslots/create'
    get 'timeslots/destroy'
  end
  namespace :admin do
    get 'calendar/new'
    get 'calendar/create'
  end
  get 'timeslots/index'
  get 'timeslots/new'
  post 'timeslots/create'

  get 'teacher/index'
  get 'teacher/show'
  get 'teacher/new'

  get 'student/index'
  get 'student/show'
  get 'admin/show'
  namespace :admin do
    resources :students, only: [:new, :edit, :create, :destroy, :update, :index]
    resources :calendar, only: [:new, :create, :destroy]
    resources :rooms, only: [:new, :create, :destroy]
    resources :messages, only: [:new, :create, :destroy]
    resources :timeslots, only: [:new, :create, :destroy]
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :static_pages
  root to: "static_pages#home"

  resources :lesson, only: [:create, :destroy]
  resources :calendar, only: [:index, :create, :new, :show]
  resources :rooms, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create, :index]
  get 'home', to: 'static_pages#home'
  get 'accueille', to: 'static_pages#accueille'
  get 'permis_auto', to: 'static_pages#permis_auto'
  get 'permis_moto', to: 'static_pages#permis_moto'
  get 'contact', to: 'static_pages#contact'

end
