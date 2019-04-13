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
    @shop_item = ShopItem.find_by_product_name(params[:product_name])
    @shop_item.update(quantity_in_stock: @shop_item.quantity_in_stock + 1)
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
    @voucher = Voucher.find_by_name('£10.00 off when you spend over £50.00')
    if @voucher.is_applied == true
      @voucher.update(is_applied: false)
      redirect_to root_url, notice: 'Vouchers removed when item deleted from basket.'
    else
      redirect_to root_url
    end
  end
end
