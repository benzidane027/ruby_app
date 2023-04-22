class ApplicationController < ActionController::API
  REFRESH_EXP = Time.now.to_i + 3600 * 6 # six hours
  ACCESS_EXP = Time.now.to_i + 3600      # one hours
  SECRET = '8125aqN?!sollz_!=yt'.freeze

  def self.encode_token(user_id:, type: :access)
    payload = {}
    payload[:user_id] = user_id
    payload[:exp] = type == :access ? ACCESS_EXP : REFRESH_EXP
    payload[:type] = type
    token = JWT.encode(payload, SECRET)
    ActiveRefresToken.new(token: token, user_id: user_id).save if type == :refresh
    { data: token, code: :good, msg: '' }
  end

  def self.decode_token(token)
    data = JWT.decode(token, SECRET)
    { data: data, code: :good, msg: '' }
  rescue StandardError
    { data: '', code: :bad, msg: 'token is invalid' }
  end
end
