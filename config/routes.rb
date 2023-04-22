Rails.application.routes.draw do

  post '/auth/login' => 'auth#login'
  post '/auth/login_from_token' => 'auth#login_from_token'

  # root to: 'main#home'
  get '/' => 'main#home'
end
