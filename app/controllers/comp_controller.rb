# frozen_string_literal: true

class CompController < ApplicationController
  def add
    user_id = ApplicationController.decode_token(request.headers['Authorization'].to_s.split[1])[:data][0]['user_id']
    complaint = Complaint.new(
      user_id: user_id, description: params['description'].to_s,
      comp_type: params['comp_type'].to_s,
      address: params['address'].to_s,
      picture: params[:picture]
    )
    if complaint.validate
      complaint.save!
      return render json: {}, status: 200
    end
    render json: complaint.errors.to_json, status: 400
  end

  def get
    user_id = ApplicationController.decode_token(request.headers['Authorization'].to_s.split[1])[:data][0]['user_id']
    @complaints = Complaint.where(user_id: user_id.to_s)
    render json: { data: @complaints.as_json }, status: 200
  end
end
