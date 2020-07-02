class Credit < ApplicationRecord

  #アソシエーション
  has_one :user, dependent: :destroy

  # 必須項目(空欄禁止)  
  validates :card_fullname, :card_number, :expiration_year,
            :expiration_month, :security_code, :user, presence: true

  #属性の値を一意にする
  validates :card_number, :user, uniqueness: true

  #クレジットカードの名前
  validates :card_fullname,
    format: { with: /\A[A-Z]+\s[A-Z]+\z/, message: 'を半角アルファベット(大文字)で入力してください' }

  #クレジットカード番号, 有効期限
  validates :card_number,
    format: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' },
    length: { maximum: 16 }

  #有効期限(月/年)
  validates :expiration_month, :expiration_year,
    format: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' }

  #セキュリティコード
  validates :security_code,
    format: { with: /\A[0-9]+\z/, message: 'を半角数字で入力してください' },
    length: { maximum: 4 }
end
