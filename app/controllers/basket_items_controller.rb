class BasketItemsController < ApplicationController
  def create
    if params[:quantity_in_stock].to_i == 0
      redirect_to root_url, notice: 'Item out of stock.'
    else
      @basket_item = BasketItem.create(
        product_name: params[:product_name], price: params[:price],
        category: params[:category]
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
