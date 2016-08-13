class VouchersController < ApplicationController
  def index
    @vouchers = filter_by_environment(params)
    @vouchers = filter_by_count(@vouchers, params[:count])
    respond_to do |format|
      format.html
      format.json { render(json: @vouchers) }
    end
  end

  private

  def filter_by_environment(params)
    if environment(params[:environment]).nil?
      Voucher.paginate(page: params[:page])
    else
      Voucher.where(environment: environment(params[:environment]))
    end
  end

  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end

  def filter_by_count(full_list, count)
    if count.nil?
      full_list
    else
      begin
        count = count.to_i
        full_list.first(count)
      rescue TypeError
        full_list
      end
    end
  end
end
