class Sim < ApplicationRecord
  belongs_to :environment
  self.per_page = 10

  def self.reserve(by: nil, environment: 'battlefield', count: 1)
    raise "Needs a 'reserved_by'" if by.nil? || by.strip == ''
    count = 100 if count > 100
    Sim.where(environment_id: Environment.where(name: environment).first, in_use: false).limit(count).map do |sim|
      sim.update_attributes(notes: by, in_use: true)
      sim
    end
  end
end
