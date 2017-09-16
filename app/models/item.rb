class Item < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_many :order_items
  has_many :orders, through: :order_items

  validates_presence_of :name, :description, :price, message: "%{attribute} can not be blank"
  validates_uniqueness_of :name, :description, message: "Item with %{attribute} %{value} already exists"

  enum status: [:Active, :Retired]

  def to_money
    "$#{Money.new(price, "USD")}"
  end

end
