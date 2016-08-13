class Environment < ApplicationRecord
  has_many :promos
  self.per_page = 10
end
