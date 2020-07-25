class Credit < ApplicationRecord

  #アソシエーション
  belongs_to :user, dependent: :destroy
  validates :customer_id, :card_id, presence: true
end
