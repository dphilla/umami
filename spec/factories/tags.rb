FactoryGirl.define do
  factory :tag do
    sequence :name do |i|
      "TibetanleS#{i}"
    end
  end
end
