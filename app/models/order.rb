class Order < ApplicationRecord
  belongs_to :item
  has_one :address
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
