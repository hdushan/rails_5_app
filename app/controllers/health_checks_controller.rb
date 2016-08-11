class HealthChecksController < ApplicationController
  def index
    render plain: 'Success'
  end
end
