class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :schedule
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :schedule_id
    validates :price
  end
  
  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :schedule_id
  end

  validates :item_name, length: { maximum: 40, message: "must not exceed 40 characters"}
  validates :description, length: { maximum: 1000, message: "must not exceed 1000 characters"}
  validates_inclusion_of :price, in:300..9999999, message: "should be between 300 and 9999999"
end