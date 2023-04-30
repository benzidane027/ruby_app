class MainController < ApplicationController
  def index
    puts '********* this is params *************'
    # comp = Complaint.find_by(id: 1)

    comp = Complaint.new(
      picture: params[:picture],
      user_id: 1,
      comp_type: 'hygiene',
      description: 'descri',
      address: 'addr'
    )

    if comp.validate
      puts 'saved'
      comp.save!
    else
      puts 'note saved'
      puts comp.errors.to_json
    end

    puts '********* end  of params *************'
    render json: { data: comp }, status: 200
  end
end
