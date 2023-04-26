class CompController < ApplicationController
  def add
    render json: {}, status: 200
  end

  def get
    user_id = ApplicationController.decode_token(request.headers['Authorization'].to_s.split[1])[:data][0]['user_id']
    @user = User.find_by_id(1)

    render json: { data: @user.complaints }, status: 200
  end
end
