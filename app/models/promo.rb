class Promo < ApplicationRecord
  belongs_to :environment
  self.per_page = 10
end
