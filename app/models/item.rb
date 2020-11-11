class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: 'Select'}#ジャンルの選択が---のときは選択できないようにする
    validates :status_id, numericality: { other_than: 1, message: 'Select' }  
    validates :burden_id, numericality: { other_than: 1, message: 'Select'} 
    validates :area_id, numericality: { other_than: 1, message: 'Select'}
    validates :days_id, numericality: { other_than: 1, message: 'Select' } 
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'}
    validates :user
    validates :image
  end
    validates :price, numericality: {with: /\A[a-zA-Z0-9]+\z/, message: "Half-width number"}

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
