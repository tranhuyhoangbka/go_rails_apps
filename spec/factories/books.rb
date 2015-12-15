# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string(255)
#  image       :string(255)
#  user_id     :integer
#
# Indexes
#
#  index_books_on_slug     (slug) UNIQUE
#  index_books_on_user_id  (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    sequence(:title){Faker::Book.title}
    sequence(:description){Faker::Lorem.paragraph}
  end
end
