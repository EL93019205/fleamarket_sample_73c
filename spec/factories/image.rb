FactoryBot.define do
  factory :image, class: Image do
    item_id    {"1"}
    src  {File.open("#{Rails.root}/app/assets/images/sample1.jpeg")}
    association :item
  end
end
