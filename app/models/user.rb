class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases
  with_options presence: true do
    validates :nickname
    validates :password,
    format: { with: /\A[a-zA-Z0-9]+\z/}
    validates :family_name,
    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name,
    format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :family_name_kana,
    format: { with: /\A([ァ-ン]|ー)+\z/}
    validates :first_name_kana,
    format: { with: /\A([ァ-ン]|ー)+\z/}
    validates :birthday
  end
end
