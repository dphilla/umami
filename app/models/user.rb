class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :email, :address, :password
  validates_uniqueness_of :name, :email
  has_many :orders

  enum status: [:default, :admin]
end
