class Item < ApplicationRecord

  # validation
  validates :name, presence: true
  validates :price, presence: true

  # association
#  has_many :purchases
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
#  belongs_to :user
#  belongs_to :brand
#  belongs_to :category
end