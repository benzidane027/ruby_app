class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include Paperclip::Glue
  include Rails.application.routes.url_helpers

  def self.ransackable_attributes(auth_object = nil)
    authorizable_ransackable_attributes
  end

  def self.ransackable_associations(auth_object = nil)
    authorizable_ransackable_associations
  end
end
