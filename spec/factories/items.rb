FactoryBot.define do
  factory :item do
    name {"コーヒーカップ"}
    explanation {"新品のコーヒーカップです"}
    category_id {rand(2..11)}
    status_id {rand(2..7)}
    burden_id {rand(2..3)}
    area_id {rand(2..48)}
    days_id {rand(2..4)}
    price {rand(300..9999999)}
    user
  end
end
