class CreditCardsController < ApplicationController
  def index
    @credit_cards = CreditCard.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render(json: @credit_cards) }
    end
  end

  def fetch
    @credit_cards = CreditCard.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @credit_cards
  end

  private

  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end
end
