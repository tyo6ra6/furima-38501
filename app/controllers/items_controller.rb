class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit ]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :contributor_confirmation, only: [:edit ]


  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  
  end

  def edit 
   
  end

  def update
   if  @item.update(item_params)
      redirect_to item_path
   else
    render :edit
   end
  end 

  private

  def item_params
    params.require(:item).permit(:item_name, :text, :price, :image, :category_id, :condition_id, :shipping_payer_id, :area_id,
                                 :take_time_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end
