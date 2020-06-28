FactoryBot.define do

  factory :user do
    nickname              {"tarou_yamada"}
    password              {"password"}
    password_confirmation {"password"}
    email                 {"tarou.yamada@gmail.com"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-06-28 00:00:00.000000"}
    d_family_name         {"山田"}
    d_first_name          {"太郎"}
    d_family_name_kana    {"ヤマダ"}
    d_first_name_kana     {"タロウ"}
    zipcode               {"0000000"}
    prefecture            {"愛知県"}
    city                  {"名古屋市"}
    address               {"中区栄3-13-20"}
    building_name         {"栄センタービル3F"}
    phone_number          {"00000000000"}
  end

end