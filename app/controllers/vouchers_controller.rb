class VouchersController < ApplicationController
  def apply
    @voucher = Voucher.where(name: params[:name])
    @voucher.update(is_applied: true)
    redirect_to root_url
  end
end
