class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  self.per_page = 10
end
