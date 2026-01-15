class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, format: { with: /\A\S+@\S+\z/ }, uniqueness: { case_sensitive: false }
end
