module UtilityMethods
  extend ActiveSupport::Concern
  def environment(environment_in_params)
    unless environment_in_params.nil?
      Environment.find_by(name: environment_in_params)
    end
  end
end
