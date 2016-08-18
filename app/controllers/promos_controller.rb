class PromosController < ApplicationController
  include UtilityMethods
  def index
    if user_signed_in?
      @promos = Promo.all.paginate(page: params[:page])
    else
      flash.now[:alert] = "Production Promos hidden as you haven't logged in!"
      @promos = Promo.where.not(environment: environment('production')).paginate(page: params[:page])
    end
    respond_to_formats(@credit_cards)
  end

  def fetch
    @promos = Promo.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @promos
  end
end
