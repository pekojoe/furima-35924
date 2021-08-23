class PurchasesController < ApplicationController
  def index #購入ページを表示
    @item = Item.find(params[:item_id]) #購入したいitem_idのレコードを取得
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id]) #購入したいitem_idのレコードを取得
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
