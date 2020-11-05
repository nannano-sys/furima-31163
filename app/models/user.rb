class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence :true do
    validates :nickname
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"名前は全角（漢字・ひらがな・カタカナ）で入力してください。"}
    validates :family_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"名前は全角（漢字・ひらがな・カタカナ）で入力してください。"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message:"フリガナは全角（カタカナ）で入力してください。"}
    validates :family_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message:"フリガナは全角（カタカナ）で入力してください。"}
    validates :birthday
  end

    has_many :items
    has_many  :orders
end
