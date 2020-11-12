require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/test_image.png')
  end

  describe '商品出品機能' do
    context '出品がうまくいく場合' do
      it '空欄が全て埋まっていれば出品できる' do
        expect(@item).to be_valid
      end

      it '価格の情報が存在すれば出品できる' do
        @item.price
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない場合' do
      it '商品画像が存在しなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明が存在しなければ出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリの情報が存在しなければ出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'カテゴリの情報が存在しなければ出品できない(空の場合)' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が存在しなければ出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it '商品の状態の情報が存在しなければ出品できない(空の場合)' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報が存在しなければ出品できない' do
        @item.burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden Select')
      end
      it '配送料の負担の情報が存在しなければ出品できない(空の場合)' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it '配送元の地域の情報が存在しなければ出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area Select')
      end
      it '配送元の地域の情報が存在しなければ出品できない(空の場合)' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数の情報が存在しなければ出品できない' do
        @item.days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days Select')
      end
      it '発送までの日数の情報が存在しなければ出品できない(空の場合)' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it '価格の情報が存在しなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が¥300~¥9,999,999の間でなければ出品できない(¥\b\b300以下の場合)" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '価格の範囲が¥300~¥9,999,999の間でなければ出品できない(¥9,999,999以上の場合)' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it '販売価格が半角数字でなければ出品できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
    end
  end
end
