class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  
  validates :user, presence: true
  # validates :items, presence: true
  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    "$#{Money.new(items.sum(:price))}"
  end

  def get_quantity(id)
    items.where(id: id).count
  end

  def get_item_total(item_id)
    "$#{Money.new((get_quantity(item_id) * items.find(item_id).price))}"
  end

  def get_order_items
    items = []
    @cart.contents.each do |k, v|
      v.times do
        items << Item.find(k.to_i)
      end
    end
    items
  end
  
  def total_quantity
    items.count
  end

end
