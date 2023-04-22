class MainController < ApplicationController
  def home
    name = params['name']
    render json:
            {
              data: "hello #{name}",
              users: User.find_by_sql("select * from users where fname='#{name}'")
            },
           status: 200
  end
end
