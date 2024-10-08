require 'json'
class AuthController < ApplicationController
  def log_in
    user = User.find_by(email: params[:email].to_s).try(:authenticate, params[:password].to_s)
    if user
      access_token = ApplicationController.encode_token user_id: user.id, type: :access
      refresh_token = ApplicationController.encode_token user_id: user.id, type: :refresh
      render json: user.to_h.merge({ tokens:
                    {
                      access: access_token[:data],
                      refresh: refresh_token[:data]
                    } }).to_json,
             status: '200'
    else
      render json: {}, status: 404
    end
  end

  def sing_up
    user = User.new(
      fname: params[:fname].to_s,
      lname: params[:lname].to_s,
      email: params[:email].to_s,
      password: params[:password].to_s,
      password_confirmation: params[:password].to_s,
      phone: params[:phone].to_s,
      address: params[:address].to_s,
      picture: params[:picture]
    )
    print "##############11################\n"
    print params[:picture]
    print "##############22################\n"

    if user.validate
      user.save
      render json: { data: "" }, status: 201
    else
      render json: { data: "", errors: user.errors }, status: 400
    end
  end

  def token_refresh
    token = ApplicationController.decode_token(params[:refresh].to_s) ## check validity
    return render json: { data: 'invalid token' }, status: 400 if token[:code] == :bad

    register = ActiveRefresToken.find_by(token: params[:refresh].to_s) ## check availibility
    return render json: { data: 'invalid token' }, status: 404 unless register

    user_id = register.user_id
    user_object = User.find_by(id: user_id)
    access_token = ApplicationController.encode_token user_id: user_id, type: :access
    render json: user_object.to_h.merge(access: access_token[:data]).to_json, status: 200
  end

  def google_auth
    render json: { data: '' }
  end

  def log_out
    decoded_access = ApplicationController.decode_token(request.headers['Authorization'].to_s.split[1])
    decoded_refresh = ApplicationController.decode_token(params['refresh'].to_s)

    return render json: { data: :bad01 }, status: 400 if decoded_access[:code] == :bad ## check validity
    return render json: { data: :bad02 }, status: 400 if decoded_refresh[:code] == :bad ## check validity
    unless decoded_access[:data][0]['user_id'].to_s == decoded_access[:data][0]['user_id'].to_s
      return render json: { data: :bad04 }, status: 400 ## check compatibility
    end

    regirenderster = ActiveRefresToken.find_by(token: params['refresh'].to_s) ## check availibility
    return render json: { data: :bad05 }, status: 404 unless register

    render json: { data: :good }, status: 200
  end
end
