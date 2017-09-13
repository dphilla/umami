class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def add_item(item_id)
    contents[item_id.to_s] += 1
  end

  def total_count
    contents.values.sum
  end

  def total_cost
    contents.reduce(0) do |total, item|
      total += Item.find(item[0]).price * count_of(item[0])
    end
  end

end
