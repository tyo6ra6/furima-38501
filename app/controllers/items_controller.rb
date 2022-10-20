class ItemsController < ApplicationController
  
    def  index
        @item = Item.all
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
    
    private

    def item_params
       params.require(:item).permit(:item_name, :text, :price, :image, :category_id, :condition_id, :shipping_payers_id, :area_id, :take_times_id ).merge(user_id: current_user.id)
    end
   
end
