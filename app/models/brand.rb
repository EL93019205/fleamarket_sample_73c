class Brand < ApplicationRecord
  # validation
  validates :name, presence: true, uniqueness: true, index: true

  #association
  has_many :items
end
