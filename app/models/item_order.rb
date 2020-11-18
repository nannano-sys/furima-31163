class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :token # トークンにバリデーションを設定し、カード情報が正しく入力されない場合のバリデーションをかける
    validates :postal_cord, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Please Include hyphen(-)' } # string型のため、formatオプションを使用
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Please make sure the city name' }
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Input only number' }
  end
  validates :phone_number, length: { maximum: 11, minimum: 10, message: 'is invalid. Please enter within 10 or 11 digits' }

  def save
    # order_idに保存するため、orderの情報を取得し、orderという変数に格納した
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所情報を保存する
    Address.create(postal_cord: postal_cord, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
