require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品購入機能' do
    context "商品の購入がうまくいく場合" do
      it "全ての空欄が正しく埋まっていれば購入できる" do
        expect(@item_order).to be_valid
      end
    

      it "建物名が空欄でも購入できる" do
        @item_order.building_name = ""
        expect(@item_order).to be_valid
      end
    end

    context "商品の購入がうまくいかない場合" do
      it "トークンの情報がないと購入できない" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空欄だと購入できない" do
        @item_order.postal_cord = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal cord can't be blank")
      end

      it "郵便番号にハイフン(-)がないと購入できない" do
        @item_order.postal_cord = "1111111"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal cord is invalid. Please Include hyphen(-)")
      end

      it "都道府県が空欄だと購入できない" do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "都道府県が未選択だと購入できない" do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture Select")
      end

      it "市町村が空欄だと購入できない" do
        @item_order.municipality = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "市町村名が適切でないと購入できない" do
        @item_order.municipality = "abcde"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Municipality is invalid. Please make sure the city name")
      end

      it "番地が空欄だと購入できない" do
        @item_order.house_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("House number can't be blank")
      end

      it "電話番号が空欄だと購入できない" do
        @item_order.phone_number = ""
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号が適切でないと購入できない(数字以外)" do
        @item_order.phone_number = "abc"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number Input only number") 
        end

      it "電話番号が適切でないと購入できない(桁数がおかしい)" do
        @item_order.phone_number = "11111111111111"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone number is invalid. Please enter within 10 or 11 digits") 
      end
    end


    
  end


    
end