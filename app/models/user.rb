class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :email, format: { with: /\A\S+@\S+\z/ }, uniqueness: { case_sensitive: false }
end
