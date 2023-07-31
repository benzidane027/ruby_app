class MainController < ApplicationController
  def home
    # puts '********* this is params *************'
    # comp = Complaint.find_by(id: 1)
    # render json: { data:  url_for(comp.picture) }, status: 200

    # comp = Complaint.new(
    #   picture: params[:picture],
    #   user_id: 1,
    #   comp_type: 'hygiene',
    #   description: 'descri',
    #   address: 'addr'
    # )

    # if comp.validate
    #   puts 'saved'
    #   comp.save!
    # else
    #   puts 'note saved'
    #   puts comp.errors.to_json
    # end

    # puts '********* end  of params *************'
    respond_to do |format|
      # format.xml { render(xml: "fdsfds") }
      NotificationMailer.sender_mailer('benzidane27@gmail.com', 'hi hi raouf').deliver_now

      format.html { render(html: '<b>hello</b>'.html_safe) }
      format.json { render(json: { data: 'hello' }) }
    end
  end
end
