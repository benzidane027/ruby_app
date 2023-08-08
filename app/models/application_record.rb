class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include Paperclip::Glue
  include Rails.application.routes.url_helpers
end
