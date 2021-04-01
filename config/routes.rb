Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'movies', to: 'movies#index'
  scope 'admin' do
    # ここをindex以外にする？
    get 'movies', to: 'movies#index'
  end
end
