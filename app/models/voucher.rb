class Voucher < ApplicationRecord
  belongs_to :environment
  self.per_page = 10

  def self.unexpired(environment: 'battlefield', count: 1)
    count = 1 if count.nil? || count.zero?
    expiry_dates = Voucher.arel_table[:expiry_date]
    Voucher.where(environment_id: Environment.where(name: environment).first)
           .where(expiry_dates.gt(Date.today)).limit(count)
  end
end
