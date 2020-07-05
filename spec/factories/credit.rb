FactoryBot.define do

  factory :credit do
    card_fullname         {"TAROU YAMADA"}
    card_number           {"0000000000000000"}
    security_code         {"0000"}
    expiration            {"2022-01-01 00:00:00.000000"}
    user
  end

end