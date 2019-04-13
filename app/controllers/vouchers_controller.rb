class VouchersController < ApplicationController
  def apply
    @voucher = Voucher.where(name: params[:name])
    if not_apply_ten_pound?(params[:name], params[:total_price]) || not_apply_fifteen_pound?(params[:name], params[:total_price])
      redirect_to root_url, notice: 'You can not currently use that voucher.'
    else
      @voucher.update(is_applied: true)
      redirect_to root_url
    end
  end

  private

  def not_apply_ten_pound?(name, total_price)
    name == '£10.00 off when you spend over £50.00' && total_price.to_i <= 50
  end

  def not_apply_fifteen_pound?(name, total_price)
    name == '£15.00 off when you have bought at least one footwear item and spent over £75.00' && (total_price.to_i <= 75 || not_bought_footwear)
  end

  def not_bought_footwear
    basket = BasketItem.all
    basket.each do |item|
      if item.category == 'Women’s Footwear' || item.category == 'Men’s Footwear'
        return false
      end
    end
    true
  end
end
