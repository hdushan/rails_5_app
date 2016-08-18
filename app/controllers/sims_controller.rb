class SimsController < ApplicationController
  include UtilityMethods

  def index
    @sims = Sim.all.paginate(page: params[:page])
    respond_to_formats(@credit_cards)
  end

  def fetch
    @sims = Sim.reserve(by: params[:reserved_by], count: params[:count].to_i, environment: params[:environment])
    render json: @sims
  end
end
