class SimsController < ApplicationController
  def index
    @sims = filter_by_environment(params)
    @sims = filter_by_count(@sims, params[:count])
    respond_to do |format|
      format.html
      format.json { render(json: @sims) }
    end
  end

  private

  def filter_by_environment(params)
    if environment(params[:environment]).nil?
      Sim.paginate(page: params[:page])
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
        full_list.first(count)
      rescue TypeError
        full_list
      end
    end
  end
end
