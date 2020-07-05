class Brand < ApplicationRecord
  # validation
  validates :name, presence: true, uniqueness: true, index: true
  validates :path, presence: true, uniqueness: true

  #association
  has_many :items
end
