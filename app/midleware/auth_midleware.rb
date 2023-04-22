require 'json'

class AuthMidleWare
  def initialize(app)
    @app = app
  end

  def call(env)
    puts 'before  '
    # ORIGINAL_FULLPATH
    # REQUEST_METHOD
    # HTTP_AUTHORIZATION
    # puts JSON.pretty_generate(env)
    status, headers, response = @app.call(env)
    puts response
    puts 'after  '
    [status, headers, response]
  end
end
