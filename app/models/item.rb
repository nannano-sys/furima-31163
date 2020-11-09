class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :days_id
    validates :price, numericality: {greater_than_or_erual_to: 300 , less_than_or_equal_to: 9999999}, format: {with:/\A[a-zA-Z0-9]+\z/, message: "Half-width number"}
    validates :user
  end

  belongs_to       :user
  has_one          :order
  has_one_attached :image
end
