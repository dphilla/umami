class Item < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_many :order_items
  has_many :orders, through: :order_items

  def to_money
    "$#{Money.new(price, "USD")}"
  end

end
