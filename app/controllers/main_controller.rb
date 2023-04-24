class MainController < ApplicationController
  def index
    render json: { data: 'this is index' }, status: 200
  end
end
