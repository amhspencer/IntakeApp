class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :phone_number, :work_email

  validates :name, presence: true, length: { maximum: 50 }    # validate the name field
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
  format: { with: VALID_EMAIL_REGEX }, uniqueness: true       # validate the email field
  has_secure_password                                         # secured password
  validates :password, length: { minimum: 6 }                 # validate password
 
end
