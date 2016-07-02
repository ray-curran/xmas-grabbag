Rails.application.routes.draw do


  get '/logout' => 'users#destroy', as: 'logout'
  post '/login' => 'users#login', as: 'login'

  namespace :api, defaults: {format: :json} do
    resources :pairs
    get '/kidpairs' => 'pairs#kidpairs'
    get '/adultpairs' => 'pairs#adultpairs'
    get '/allpairs' => 'pairs#allpairs'
    get '/allpeople' => 'pairs#allpeople'
    get '/tradegifts' => 'pairs#tradegifts'
  end

  resources :gifts do
    member do
        put '/markbought' => 'gifts#markbought'
      end
  end

  root 'application#index'

  get '*path', :to => redirect('/#/%{path}')

end
