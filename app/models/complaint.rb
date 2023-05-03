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
  has_one_attached :picture

  attribute :is_seen, :boolean, default: false
  attribute :state, :string, default: 'in_progress'

  validates_length_of :description, :address, in: 3..150, message: 'must be more 3 chracter'
  validates :comp_type, inclusion: { in: TYPES }

  validates_associated :users_id
  validates :picture,
            attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            processable_image: true,
            size: { between: 1.kilobyte..8.megabytes , message: 'is not given between size ' }
  # validates :users_id, presence: true
  # comp_type
end
