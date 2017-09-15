class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    "$#{Money.new(items.sum(:price))}"
  end

  def get_quantity(id)
    items.where(id: id).count
  end

  def get_item_total(item_id)
    "#{Money.new((get_quantity(item_id) * items.find(item_id).price))}"
  end

end
