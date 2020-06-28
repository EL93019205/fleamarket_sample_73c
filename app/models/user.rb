class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# アソシエーション
  has_one :credit, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :purchases

# 必須項目(空欄禁止)
  validates :email, :encrypted_password, :nickname, :famiry_name, :first_name, \
            :famiry_name_kana, :first_name_kana, :birthday, \
            :d_family_name, :d_first_name, :d_family_name_kana, :d_first_name_kana, \
            :zipcode, :prefecture, :city, :address, \
            presence: true

# メールアドレス重複防止
  validates :email, uniqueness: true

# メールアドレス関連
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX, message: 'PC・携帯どちらでも可' },
    uniqueness: { case_sensitive: false }

# パスワード関連
  devise :validatable, password_length:7..15
  validates :encrypted_password,
    format: { with: /\A[a-z0-9]+\z/i, message: '7文字以上の半角英数字' }

# 名前関連
  validates :family_name,
    format: { with: /\A[一-龥ぁ-ん]/, message: '例)早川' }
  validates :first_name,
    format: { with: /\A[一-龥ぁ-ん]/, message: '例)マイケル' }
# 名前関連(カナ)
  validates :family_name_kana,
    format: { with: /\A([ァ-ン]|ー)+\z/, message: '例)ハヤカワ' }
  validates :first_name_kana,
    format: { with: /\A([ァ-ン]|ー)+\z/, message: '例)マイケル' }

# 宛先名関連
  validates :d_family_name,
  format: { with: /\A[一-龥ぁ-ん]/, message: '例)早川' }
  validates :d_first_name,
  format: { with: /\A[一-龥ぁ-ん]/, message: '例)マイケル' }
# 宛先名関連(カナ)
  validates :d_family_name_kana,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: '例)ハヤカワ' }
  validates :d_first_name_kana,
  format: { with: /\A([ァ-ン]|ー)+\z/, message: '例)マイケル' }

# 郵便番号
  validates :zipcode,
    format: { with: /\A\d{7}\z/, message: "は'-'を含めない７桁で入力してください" }

# 都道府県 
  enum prefecture: {
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

# 市区町村
  validates :city,
    format: { with: /\A[一-龥ぁ-ん]/, message: '例)名古屋市' }

end
