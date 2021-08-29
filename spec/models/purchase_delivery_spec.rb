require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空では保存できないこと' do
        @purchase_delivery.user_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できないこと' do
        @purchase_delivery.item_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では保存できないこと' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは「3桁ハイフン4桁」の半角文字列以外では保存できないこと' do
        @purchase_delivery.postal_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが未選択では保存できないこと' do
        @purchase_delivery.prefecture_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では保存できないこと' do
        @purchase_delivery.prefecture_id = 1
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では保存できないこと' do
        @purchase_delivery.municipality = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @purchase_delivery.address = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @purchase_delivery.phone_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは9桁以下では保存できないこと' do
        @purchase_delivery.phone_number = '090123456'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは12桁以上では保存できないこと' do
        @purchase_delivery.phone_number = '090123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberは半角数字以外が含まれていると保存できないこと' do
        @purchase_delivery.phone_number = '０９０１２３４５６７８'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
