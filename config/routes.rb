Rails.application.routes.draw do
  ##### user endpoint ###########################

  post '/user/login' => 'auth#log_in'
  post '/user/register' => 'auth#sing_up'
  post '/user/token-refresh' => 'auth#token_refresh'
  # post '/user/google-auth' => 'auth#google_auth'
  post 'user/logout' => 'auth#log_out'
  ###############################################

  ##### complaints ##############################

  ###############################################
  # root to: 'main#home'
  get '/' => 'main#home'
end
