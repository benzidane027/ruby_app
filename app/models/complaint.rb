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
# complaint
class Complaint < ApplicationRecord
  belongs_to :users_id, class_name: "User", optional: true
  has_one_attached :picture, dependent: :destroy

  attribute :is_seen, :boolean, default: false
  attribute :state, :string, default: "in_progress"

  validates_length_of :description, :address, in: 3..150, message: "must be more 3 chracter"
  validates :comp_type, inclusion: { in: TYPES }

  validates_associated :users_id
  validates :picture,
            attached: true,
            content_type: ["image/png", "image/jpg", "image/jpeg"],
            processable_image: true,
            size: { between: 1.kilobyte..8.megabytes, message: "is not given between size " },
            allow_blank: true

  def as_json
    Hash({
           "id": id,
           "description": description,
           "address": address,
           "comp_type": comp_type,
           "state": state,
           "is_seen": is_seen,
           "created_at": created_at,
           "updated_at": updated_at,
           "user_id": user_id,
           "has_picture": picture.attached?,
           "picture": picture.attached? ? { id: picture.id, type: picture.record_type, record_id: picture.record_id } : {},
         })
  end

  def get_picture
    return unless picture.attached?

    picture
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[picture_attachment picture_blob users_id]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[blob_id created_at id name record_id record_type]
  end
end
