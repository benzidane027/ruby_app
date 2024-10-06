class User < ApplicationRecord
  has_many :complaints, class_name: 'Complaint', autosave: true
  has_one_attached :picture, dependent: :destroy
  has_secure_password


  attribute :is_active, :boolean, default: true
  attribute :is_staff, :boolean, default: false

  validates :email, email_format: { message: 'Invalid format' }
  validates_uniqueness_of :email, on: [:create], message: 'must be unique'
  validates_length_of :fname, :lname, in: 3..20, message: 'must be more 3 chracter'
  validates_length_of :phone, is: 10, message: 'must be  10 diget', allow_blank: true
  validates_length_of :address, in: 3..100, message: 'is invalid', allow_blank: true
  validates_length_of :password, on: :create, in: 5..30, message: 'is invalid'
  validates_numericality_of :phone, only_integer: true, message: 'must be integer', allow_blank: true
  validates :picture,
            attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg'],
            processable_image: true,
            size: { between: 1.kilobyte..8.megabytes, message: 'is not given between size ' },
            allow_blank: true
  
  def as_json(options = {})
    super(options.merge({ except: %i[password_digest is_active is_staff created_at updated_at] }))
  end

  def to_h
    Hash({ f_name: fname, l_name: lname, email: email, phone: phone, address: address })
  end
end
