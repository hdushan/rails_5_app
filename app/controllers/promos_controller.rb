class PromosController < ApplicationController
  def index
    if params[:environment] != nil
      env=Environment.find_by(name: params[:environment])
      @promos = Array(Promo.find_by(environment: env))
    else
      @promos = Promo.all
    end
    respond_to do |format|
      format.html
      format.json { render(json: @promos) }
    end
  end
end
