class PagesController < ApplicationController
  def home
    redirect_back(fallback_location: sims_path)
  end
end
