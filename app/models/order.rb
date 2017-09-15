class Order < ApplicationRecord
  belongs_to :user

  enum status: [:ordered, :paid, :cancelled, :completed]
end
