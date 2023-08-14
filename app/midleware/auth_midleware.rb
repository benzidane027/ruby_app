# frozen_string_literal: true

require 'json'

class AuthMidleWare
  def initialize(app)
    @app = app
  end

  def call(env)
    # ORIGINAL_FULLPATH
    # REQUEST_URI
    # REQUEST_PATH
    # REQUEST_METHOD
    # HTTP_AUTHORIZATION

    if ['/user/complaints', '/user/complaints/image'].find_index(env['REQUEST_PATH'])
      token = ApplicationController.decode_token(env['HTTP_AUTHORIZATION'].to_s.split[1])
      if token[:code] == :bad
        return [401, { 'Content-Type' => 'application/json' },
                [{ 'data' => 'Unauthorized' }.to_json]]
      end
    end
    status, headers, response = @app.call(env)
    [status, headers, response]
  end
end
