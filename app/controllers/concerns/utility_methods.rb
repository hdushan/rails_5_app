module UtilityMethods
  extend ActiveSupport::Concern
  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end

  def respond_to_formats(response_list)
    respond_to do |format|
      format.html
      format.json { render(json: response_list) }
    end
  end
end
