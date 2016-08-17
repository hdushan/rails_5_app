class DirectDebitsController < ApplicationController
  def index
    @direct_debits = DirectDebit.all
    respond_to do |format|
      format.html
      format.json { render(json: @direct_debits) }
    end
  end

  def fetch
    @direct_debits = DirectDebit.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @direct_debits
  end

  private

  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end
end
