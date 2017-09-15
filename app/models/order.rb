class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: [:ordered, :paid, :cancelled, :completed]

  before_save :tally_total

  private

  def tally_total
    self[:total_price] = OrderItem.group(:id).sum(:quantity).values.sum
  end

end
