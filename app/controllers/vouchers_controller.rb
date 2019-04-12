class VouchersController < ApplicationController
  def apply
    @voucher = Voucher.where(name: params[:name])
    if params[:name] == '£10.00 off when you spend over £50.00' && params[:total_price].to_i < 50
      redirect_to root_url, notice: 'You can not currently use that voucher.'
    else
      @voucher.update(is_applied: true)
      redirect_to root_url
    end
  end
end
