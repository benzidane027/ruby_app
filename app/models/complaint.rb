class Complaint < ApplicationRecord
  belongs_to :users_id, class_name: 'User', optional: true
end
