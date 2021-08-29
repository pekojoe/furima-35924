class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address,
                :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_number,
              format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                    building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
