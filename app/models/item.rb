class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1 }  #ジャンルの選択が---のときは選択できないようにする
    validates :status_id, numericality: { other_than: 1 }  
    validates :burden_id, numericality: { other_than: 1 } 
    validates :area_id, numericality: { other_than: 1 } 
    validates :days_id, numericality: { other_than: 1 } 
    validates :price, numericality: {greater_than_or_erual_to: 300 , less_than_or_equal_to: 9999999}, format: {with:/\A[a-zA-Z0-9]+\z/, message: "Half-width number"}
    validates :user
  end

  belongs_to       :user
  has_one          :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :category
  belongs_to :day
  belongs_to :status
end
