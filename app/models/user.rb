class User < ApplicationRecord

  has_secure_password
  normalizy :emaile, with: :strip


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: {minimum: 5}, presence: true
  validates :password_confirmation, presence: true

end
