Rails.application.routes.draw do

  root 'welcome#index'

  get '/logout' => 'users#destroy', as: 'logout'
  post '/login' => 'users#login', as: 'login'

end
