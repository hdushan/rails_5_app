class DirectDebitsController < ApplicationController
  include UtilityMethods
  def index
    @direct_debits = if user_signed_in?
                       DirectDebit.all.paginate(page: params[:page])
                     else
                       DirectDebit.where.not(environment: environment('production')).paginate(page: params[:page])
                     end
    respond_to_formats(@credit_cards)
  end

  def fetch
    @direct_debits = DirectDebit.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @direct_debits
  end
end
