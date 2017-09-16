FactoryGirl.define do
  factory :item do
    price 5.00
    status 0
    image "http://i0.kym-cdn.com/photos/images/facebook/000/918/952/d5a.png"
    sequence :name do |i|
      "Sel#{i}"
    end
    sequence :description do |i|
      "#{i}insert lorem here"
    end
  end
end
