class PaypalAccountsController < ApplicationController
  include UtilityMethods

  def index
    if user_signed_in?
      @paypal_accounts = PaypalAccount.all.paginate(page: params[:page])
    else
      flash.now[:alert] = "Production PayPal Accounts hidden as you haven't logged in!"
      @paypal_accounts = PaypalAccount.where.not(environment: environment('production')).paginate(page: params[:page])
    end
    respond_to_formats(@credit_cards)
  end

  def fetch
    @paypal_accounts = PaypalAccount.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @paypal_accounts
  end
end
