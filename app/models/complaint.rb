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

  attribute :is_seen, :boolean, default: false
  attribute :state, :string, default: 'in_progress'
  
  validates_length_of :description, :address, in: 3..150, message: 'must be more 3 chracter'
  validates :eula, acceptance: { accept: TYPES }
  validates_associated :users_id
  # comp_type
end