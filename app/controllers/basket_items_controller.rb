class BasketItemsController < ApplicationController
  def create
    @shop_item = ShopItem.find(params[:id])
    if @shop_item.quantity_in_stock == 0
      redirect_to root_url, notice: 'Item out of stock.'
    else
      update_stock_create_basket_item
      redirect_to root_url
    end
  end

  def delete
    update_shop_item
    destroy_basket_item
    @vouchers = Voucher.all
    if vouchers_applied?
      remove_vouchers
      redirect_to root_url, notice: 'Vouchers removed when an item deleted from basket.'
    else
      redirect_to root_url
    end
  end

  private

  def update_stock_create_basket_item
    @shop_item.update(quantity_in_stock: @shop_item.quantity_in_stock - 1)
    @basket_item = BasketItem.create(
      product_name: @shop_item.product_name, price: @shop_item.price,
      category: @shop_item.category
    )
  end

  def update_shop_item
    @shop_item = ShopItem.find_by_product_name(params[:product_name])
    @shop_item.update(quantity_in_stock: @shop_item.quantity_in_stock + 1)
  end

  def destroy_basket_item
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
  end

  def vouchers_applied?
    @vouchers[0].is_applied || @vouchers[1].is_applied || @vouchers[2].is_applied
  end

  def remove_vouchers
    @vouchers.each do |item|
      item.update(is_applied: false)
    end
  end
end
