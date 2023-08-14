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

  def image
    user_id = ApplicationController.decode_token(request.headers['Authorization'].to_s.split[1])[:data][0]['user_id']
    complaint_id = ''

    # image_hieght = '300'
    # image_width = '300'

    begin
      complaint_id = params[:picture_id].to_i
    rescue StandardError
      render json: { data: 'bad request' }, status: 401
    end
    complaintObject = Complaint.where('id = ? AND user_id = ?', complaint_id, user_id)
    return render json: { data: 'no complaint found' }, status: 404 if complaintObject.empty?

    activeStoragePic = Complaint.where(id: complaint_id.to_i)[0].getPicture
    return render json: { data: 'complaint has no picture' }, status: 404 if activeStoragePic.nil?

    # image.resize '300x300'

    image = MiniMagick::Image.read(activeStoragePic.blob.download)
    send_data image.to_blob, type: image.mime_type, disposition: 'inline'
  end
end
