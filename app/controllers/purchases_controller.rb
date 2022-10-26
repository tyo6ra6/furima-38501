class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    
    @purchase_address = PurchaseAddress.new(purchase_params) 
    
    if @purchase_address.valid?
       @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    @item = Item.find(params[:item_id])
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token] )
  end
  

end
