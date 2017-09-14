FactoryGirl.define do
  factory :user do
    sequence :name do |i|
      "Name#{i}"
    end
    sequence :email do |i|
      "Me@#{i}"
    end
    address "MyString"
    role 0
    password "Password"
  end
end
