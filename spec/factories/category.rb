FactoryBot.define do

  factory :category do
    name {"メンズ"}
    ancestry {nil}

    factory :child_category do |f|
      f.parent {create(:category)}

      factory :grand_category do |g|
        g.parent {create(:child_category)}
      end
    end
  end
end
