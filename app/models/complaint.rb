# frozen_string_literal: true

TYPES = %w[
  hygiene
  ligthing
  school
  garden
  road
  mosques
  education
  public
]

class Complaint < ApplicationRecord
  belongs_to :users_id, class_name: 'User', optional: true
  has_one_attached :picture, dependent: :destroy

  attribute :is_seen, :boolean, default: false
  attribute :state, :string, default: 'in_progress'

  validates_length_of :description, :address, in: 3..150, message: 'must be more 3 chracter'
  validates :comp_type, inclusion: { in: TYPES }

  validates_associated :users_id
  validates :picture,
            attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            processable_image: true,
            size: { between: 1.kilobyte..8.megabytes, message: 'is not given between size ' },
            allow_blank: true
  # def as_json(_options = {})
  #   puts '************************'
  #   puts Rails.application.routes.url_helpers.rails_blob_path(picture, only_path: false)
  #   puts '************************'
  #   Hash({
  #          "id": id,
  #          "description": description,
  #          "address": address,
  #          "comp_type": comp_type,
  #          "state": state,
  #          "is_seen": is_seen,
  #          "created_at": created_at,
  #          "updated_at": updated_at,
  #          "user_id": user_id
  #        })
  # end

  # def process_attachment
  #   puts "\n\n\n#####################"
  #   pdf_attachment_path = Rails.root.to_s + "/storage/#{picture.filename}"
  #   File.open(pdf_attachment_path, 'wb') do |file|
  #     file.write(pdf_attachment.download)
  #   end
  #   puts "#####################\n\n\n"
  # end
  # validates :users_id, presence: true
  # comp_type
end
