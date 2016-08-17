class VouchersController < ApplicationController
  def index
    @vouchers = Voucher.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render(json: @vouchers) }
    end
  end

  def fetch
    @sims = Voucher.unexpired(count: params[:count].to_i, environment: params[:environment])
    render json: @sims
  end
end
