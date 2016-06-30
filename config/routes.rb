Rails.application.routes.draw do

  root 'application#index'

  get '/logout' => 'users#destroy', as: 'logout'
  post '/login' => 'users#login', as: 'login'

  namespace :api, defaults: {format: :json} do
    resources :pairs
    get '/kidpairs' => 'pairs#kidpairs'
    get '/adultpairs' => 'pairs#adultpairs'
  end



end
