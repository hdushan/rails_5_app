class SimsController < ApplicationController
  def index
    all_sims_in_environment = filter_by_environment(params).paginate(page: params[:page])
    @sims = filter_by_count(all_sims_in_environment, params[:count])
    respond_to do |format|
      format.html
      format.json { render(json: @sims) }
    end
  end

  def reserve
    @sims = Sim.reserve(by: params[:reserved_by], count: params[:count].to_i, environment: params[:environment])
    render json: @sims
  end

  private

  def filter_out_reserved_sims(sims)
    sims.select { |sim| sim.in_use != true }
  end

  def reserve_sims(sims, reserver)
    sims.each do |sim|
      sim.in_use = true
      sim.notes = reserver
      sim.save
    end
  end

  def filter_by_environment(params)
    if environment(params[:environment]).nil?
      Sim.order(:id)
    else
      Sim.where(environment: environment(params[:environment]))
    end
  end

  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end

  def filter_by_count(full_list, count)
    if count.nil?
      full_list
    else
      begin
        count = count.to_i
        full_list.limit(count)
      rescue TypeError
        full_list
      end
    end
  end
end
