Rails.application.routes.draw do
  ##### user endpoint ###########################

  post '/user/login' => 'auth#log_in'
  post '/user/singup' => 'auth#sing_up'
  post '/user/token-refresh' => 'auth#token_refresh'
  # post '/user/google-auth' => 'auth#google_auth'
  post 'user/logout' => 'auth#log_out'
  ###############################################

  ##### complaints ##############################

  post 'user/complaints' => 'comp#add'
  get 'user/complaints' => 'comp#get'
  get 'user/complaints/image' => 'comp#image'
  ###############################################

  #### home page ################################

  # root to: 'main#home'
  get '/' => 'main#home'
  ###############################################
  mount ActionCable.server => '/cable'
  default_url_options host: 'http://localhost:3000'
end
