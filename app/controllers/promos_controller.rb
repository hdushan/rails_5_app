class PromosController < ApplicationController
  def index
    @promos = Promo.all
    respond_to do |format|
      format.html
      format.json { render(json: @promos) }
    end
  end
end
