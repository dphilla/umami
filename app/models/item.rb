class Item < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true# uniqueness: true,
  # validates :description, presence: true, uniqueness: true
  validates :price, presence: true


  enum status: [:Active, :Retired]

  def to_money
    "$#{Money.new(price, "USD")}"
  end

end
