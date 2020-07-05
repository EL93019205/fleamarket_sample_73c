class Brand < ApplicationRecord
  # validation
  validates :name, presence: true

  #association
  has_many :items
  has_ancestry
end
