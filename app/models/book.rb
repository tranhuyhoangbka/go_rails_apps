class Book < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, ImageUploader

  validate :file_size, if: proc{image.present?}

  belongs_to :user

  friendly_id :title, use: :slugged

  self.per_page = 10

  private
  def file_size
    if image.size.to_f/(1000*1000) > 2
      errors.add(:image, "You cannot upload a file greater than 2 MB")
    end
  end
end
