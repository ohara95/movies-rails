Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'movielist', to: 'movielist#index'
  # namespace 'admin' do
  #   get 'movies', to: 'movies#index'
  # end
  resources :movies do
    resources :schedules do
      resources :sheets, only: :index, shallow: true 
      resources :reservations
    end
    get :setup_resevation
  end

  # /movies/:movie_id/schedules/:schedule_id/sheets 座席予約
  # /movies/:movie_id/schedules/:schedule_id/reservations/new 座席予約フォーム
  # resource :movies do
  #   collection do
  #     get :movies/:movie_id/schedules/:schedule_id/sheets 
  #     get :movies/:movie_id/schedules/:schedule_id/reservations/new
  #   end
  # end
  resources :sheets, only: :index
  resources :schedules


  # get 'admin/movies', to: 'admin/movies#index'
  # get 'admin/movies/new', to: 'admin/movies#new'
  # post 'admin/movies', to: 'admin/movies#create'
  # get 'admin/movies/:id/edit', to: 'admin/movies#edit'
  # delete 'admin/movies/:id', to: 'admin/movies#destroy'
  # put 'admin/movies/:id', to: 'admin/movies#update'

  namespace :admin do
    resources :movies do
      resources :schedules, shallow: true 
    end
  end
# shallow: true idがくどい時
# GET等は極力使わない
end
