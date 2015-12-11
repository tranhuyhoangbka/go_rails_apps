# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    sequence(:title){Faker::Book.title}
    sequence(:description){Faker::Lorem.paragraph}
  end
end
