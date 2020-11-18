FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_cord { '111-1111' }
    prefecture_id { rand(2..48) }
    municipality { '高崎市' }
    building_name { 'アパート101号室' }
    house_number { '1-1-1' }
    phone_number { '09067102334' }
  end
end
