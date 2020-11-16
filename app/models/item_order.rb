class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :item_id
  #バリデーションを記載する
  with_options presence: true do
    validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Please Include hyphen(-)"} #string型のため、formatオプションを使用
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'First name Full-width characters' }
    validates :house_number
    validates :phone_number, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'Enter in half-width numbers' }
  end
  validates :phone_number, length:{maximum: 11, message: 'is invalid. Please enter within 11 digits'}

  #バリデーションを記載する

  def save
    #user_idに保存するため、userの情報を取得し、userという変数に格納した
    # user = User.create(nickname: nickname, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birthday: birthday, password: password)
    #item_idに保存するため、itemの情報を取得し、itemという変数に格納した
    # item = Item.create(name: name, explanation: explanation, category_id: category_id, status_id: status_id, burden_id: burden_id, area_id: area_id, day_id: day_id, price: price)
    #order_idに保存するため、orderの情報を取得し、orderという変数に格納した
    order = Order.create(user_id: user_id, item_id: item_id)
    #住所情報を保存する
    Address.create(postal_cord: postal_cord, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end