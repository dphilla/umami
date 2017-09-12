FactoryGirl.define do
  factory :item do
    price 5.00
    stock_level 10
    image "http://i0.kym-cdn.com/photos/images/facebook/000/918/952/d5a.png"
    sequence :name do |i|
      "Sel#{i}"
    end
    description "insert lorem here"
  end
end
