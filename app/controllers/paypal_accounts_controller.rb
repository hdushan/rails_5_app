class PaypalAccountsController < ApplicationController
  def index
    @paypal_accounts = PaypalAccount.all
    respond_to do |format|
      format.html
      format.json { render(json: @paypal_accounts) }
    end
  end

  def fetch
    @paypal_accounts = PaypalAccount.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @paypal_accounts
  end

  private

  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end
end
