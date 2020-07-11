class Category < ApplicationRecord
  # バリデーション
  validates :name, presence: true

  # アソシエーション
  has_many :items
  has_ancestry
end
