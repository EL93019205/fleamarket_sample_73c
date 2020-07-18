class Credit < ApplicationRecord

  #アソシエーション
  belongs_to :user, dependent: :destroy

end
