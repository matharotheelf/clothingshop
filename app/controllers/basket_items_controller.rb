class BasketItemsController < ApplicationController
  def create
    @shop_item = ShopItem.find(params[:id])
    if @shop_item.quantity_in_stock == 0
      redirect_to root_url, notice: 'Item out of stock.'
    else
      @shop_item.update(quantity_in_stock: @shop_item.quantity_in_stock - 1)
      @basket_item = BasketItem.create(
        product_name: @shop_item.product_name, price: @shop_item.price,
        category: @shop_item.category
      )
      redirect_to root_url
    end
  end

  def delete
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
    redirect_to root_url
  end
end
