class Item < ApplicationRecord
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :price, presence: true
  validates :tags, presence: true
  
  before_save :set_image

  enum status: [:active, :retired]

  def to_money
    "$#{Money.new(price, "USD")}"
  end

  def set_image
    if self[:image].empty?
      self[:image] = "http://img.providr.com/n-SALT-628x314.jpg"
    end
  end

end
