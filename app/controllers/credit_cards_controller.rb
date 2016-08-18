class CreditCardsController < ApplicationController
  include UtilityMethods

  def index
    if user_signed_in?
      @credit_cards = CreditCard.all.paginate(page: params[:page])
    else
      flash.now[:alert] = "Production Credit Cards hidden as you haven't logged in!"
      @credit_cards = CreditCard.where.not(environment: environment('production')).paginate(page: params[:page])
    end
    respond_to_formats(@credit_cards)
  end

  def fetch
    @credit_cards = CreditCard.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @credit_cards
  end
end
