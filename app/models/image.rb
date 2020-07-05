class Image < ApplicationRecord
  # uploader
  mount_uploader :src, ImageUploader

  # validation

  # association
  belongs_to :item

end
