class Item < ApplicationRecord

  # validation
  validates :name, :introduction, :price, 
    :category, :user, :condition, :trading_status,
    :shipping_area, :shipping_days, :shipping_price, presence: true

  # association
#  has_many :purchases
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user, dependent: :destroy
  belongs_to :brand
  belongs_to :category
end