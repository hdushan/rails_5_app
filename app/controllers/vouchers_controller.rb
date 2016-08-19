class VouchersController < ApplicationController
  include UtilityMethods
  def index
    if user_signed_in?
      @vouchers = Voucher.all.paginate(page: params[:page])
    else
      flash.now[:notice] = "Production Vouchers hidden as you haven't logged in!"
      @vouchers = Voucher.where.not(environment: environment('production')).paginate(page: params[:page])
    end
    respond_to_formats(@credit_cards)
  end

  def fetch
    @sims = Voucher.unexpired(count: params[:count].to_i, environment: params[:environment])
    render json: @sims
  end
end
