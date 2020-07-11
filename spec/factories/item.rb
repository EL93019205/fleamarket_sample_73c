FactoryBot.define do

  factory :item do
    name                  {"シャネルのバッグ 限定品"}
    introduction          {"こちらの商品は、昔から愛用しており、購入から10年経っております。"}
    price                 {"100"}
    brand                 {"シャネル"}
    condition             {"新品、未使用"}
    trading_status        {"出品中"}
    shipping_area         {"愛知県"}
    shipping_days         {"1〜2日で発送"}
    shipping_price        {"送料込み(出品者負担)"}
    association :user
    association :category
  end

end
