class AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email].to_s).try(:authenticate, params[:password].to_s)
    if user
      access_token = ApplicationController.encode_token user_id: user.id, type: :access
      refresh_token = ApplicationController.encode_token user_id: user.id, type: :refresh
      render json: { user: user, accessToken: access_token[:data], refreshToken: refresh_token[:data] }, status: '200'
    else
      render json: {}, status: 404
    end
  end

  def login_from_token
    token = '' # ApplicationController.decode_token user_token
    puts "\n********************\n"
    puts request.headers['Authorization']
    puts "\n********************\n"
    render json: { data: token }
  end

  def logout
    render json: { data: ApplicationController.decode_token(params[:token]) }
  end
end
