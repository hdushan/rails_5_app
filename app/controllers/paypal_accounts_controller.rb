class PaypalAccountsController < ApplicationController
  include UtilityMethods

  def index
    @paypal_accounts = PaypalAccount.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render(json: @paypal_accounts) }
    end
  end

  def fetch
    @paypal_accounts = PaypalAccount.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @paypal_accounts
  end
end
