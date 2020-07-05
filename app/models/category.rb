class Category < ApplicationRecord
  # バリデーション
  validates :name, presence: true, uniqueness: true, index: true

  # アソシエーション
  has_many :items
end
