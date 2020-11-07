class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'First name Full-width characters' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Last name Full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name kana Full-width katakana characters' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name kana Full-width katakana characters' }
    validates :birthday
    validates :password, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: 'Password Include both letters and numbers' }
  end

  has_many :items
  has_many :orders
end
