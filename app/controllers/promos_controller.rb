class PromosController < ApplicationController
  def index
    @promos = Promo.all.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.json { render(json: @promos) }
    end
  end

  def fetch
    @promos = Promo.where(environment: environment(params[:environment])).limit(params[:count])
    render json: @promos
  end
end
