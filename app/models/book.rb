# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string(255)
#  image        :string(255)
#  user_id      :integer
#  published_at :datetime
#
# Indexes
#
#  index_books_on_slug     (slug) UNIQUE
#  index_books_on_user_id  (user_id)
#

class Book < ActiveRecord::Base
  TIME_FORMAT = "%k:%m %P %d/%m/%Y"

  extend FriendlyId
  mount_uploader :image, ImageUploader

  validate :file_size, if: proc{image.present?}

  belongs_to :user

  friendly_id :title, use: :slugged

  self.per_page = 10

  def published?
    published_at.present?
  end

  def published_at_format
    published_at.strftime TIME_FORMAT
  end

  private
  def file_size
    if image.size.to_f/(1000*1000) > 2
      errors.add(:image, "You cannot upload a file greater than 2 MB")
    end
  end
end
