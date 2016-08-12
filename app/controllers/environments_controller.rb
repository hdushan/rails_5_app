class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.all
    respond_to do |format|
      format.html
      format.json { render(json: @environments) }
    end
  end
end
