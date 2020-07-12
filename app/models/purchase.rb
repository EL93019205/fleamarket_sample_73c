class Purchase < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :item

  # 必須項目(空欄禁止)  
  validates :user, :item, presence: true

end
