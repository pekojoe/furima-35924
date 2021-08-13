class Item < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :schedule_id
    validates :price
  end
end
