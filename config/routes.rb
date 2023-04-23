Rails.application.routes.draw do
  ##### user endpoint ###########################
  post '/user/login' => 'auth#login'
  post '/user/token-refresh' => 'auth#token_refresh'
  # post '/user/google-auth' => 'auth#google_auth'
  post 'user/logout' => 'auth#logout'
  ###############################################

  ##### complaints ##############################

  ###############################################
  # root to: 'main#home'
  get '/' => 'main#home'
end
