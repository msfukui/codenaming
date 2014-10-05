# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    product_id 1
    kind "MyString"
    name "MyString"
  end
end
