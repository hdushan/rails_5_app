class SimsController < ApplicationController
  def index
    @sims = Sim.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render(json: @sims) }
    end
  end

  def fetch
    @sims = Sim.reserve(by: params[:reserved_by], count: params[:count].to_i, environment: params[:environment])
    render json: @sims
  end
end
