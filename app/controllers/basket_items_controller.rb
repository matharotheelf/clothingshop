class BasketItemsController < ApplicationController
  def create
    @basket_item = BasketItem.create(
      product_name: params[:product_name], price: params[:price]
    )
    redirect_to root_url
  end

  def delete
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
    redirect_to root_url
  end
end
