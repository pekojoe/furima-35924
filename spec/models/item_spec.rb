require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it 'image, item_name, description, category_id, status_id, burden_id, prefecture_id, schedule_id, priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end

      it 'item_nameが40文字以内であれば登録できる' do
        @item.item_name = 'あ' * 40
        expect(@item).to be_valid
      end

      it 'descriptionが1000文字以内であれば登録できる' do
        @item.description = 'あ' * 1000
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_nameが41文字以上では登録できない' do
        @item.item_name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name must not exceed 40 characters')
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1001文字以上では登録できない' do
        @item.description = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description must not exceed 1000 characters')
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが1では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'burden_idが空では登録できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it 'burden_idが1では登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'schedule_idが空では登録できない' do
        @item.schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end

      it 'schedule_idが1では登録できない' do
        @item.schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be between 300 and 9999999')
      end

      it 'priceが10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be between 300 and 9999999')
      end

      it 'priceが半角英数字混合だと登録できない' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be between 300 and 9999999')
      end

      it 'priceが半角英字では登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be between 300 and 9999999')
      end

      it 'priceが全角文字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price should be between 300 and 9999999')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
