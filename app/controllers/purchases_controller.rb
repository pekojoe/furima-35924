class PurchasesController < ApplicationController
  def index #購入ページを表示
    @item = Item.find(params[:item_id]) #購入したいitem_idのレコードを取得
    @purchase_delivery = PurchaseDelivery.new
  end

  def create #バリデーションを通過したら、決済についての情報をPayjpに渡す。
    @item = Item.find(params[:item_id]) #購入したいitem_idのレコードを取得
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid? #バリデーションを通過した場合
      purchase_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  
  def purchase_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
  
end
