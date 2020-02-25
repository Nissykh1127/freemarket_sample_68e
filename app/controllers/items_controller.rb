class ItemsController < ApplicationController
  
  def index
    @items =Item.order("id Asc").limit(4)
    @parents =Category.where(ancestry: nil)
  end

  def new
    # binding pry
    @item = Item.new
    @item.item_images.new
    @item.build_shipping
    @item.build_category
    # @item_images =Item.new
  end
  
  def create
    Item.create(items_params)
    redirect_to root_path
    # @shipping =Shipping.all
    # @category = Category.all
    # @item.save
  #   redirect_to root_path
  #   end
  # else
    # @shipping =Shipping.includes(item)
  #   flash.now[:alert] = 'メッセージを入力してください。'
  #   render :index
  #   # Shipping.create(shipping_params)
  end
  def show
    item = Item.find(params[:id])
    @item = item
    @item_images = item.item_images.limit(3)
    @parent = item.category
    @shipping = item.shipping
  end


  private
  def items_params
    params.require(:item).permit(:name, :condition_id,:text, :price, :trading_status, :buyer, :saler, :completed_at, shipping_attributes: [:delivery_fee_id, :delivery_handlingtime_id, :prefecture_code], category_attributes: [:category_user_id], item_images_attributes: %i[image_url])
  end
end
