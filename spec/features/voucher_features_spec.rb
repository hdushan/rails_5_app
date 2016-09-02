require 'spec_helper'

feature 'Voucher Features', js: true do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
  end

  context 'without signing in' do
    before do
      @voucher_production = create :voucher, code: '111111', expiry_date: Date.today + 1, environment: @environment_production
      @voucher_battlefield_expired = create :voucher, code: '222222', expiry_date: Date.today - 1, environment: @environment_battlefield
      @voucher_battlefield = create :voucher, code: '333333', expiry_date: Date.today + 1, environment: @environment_battlefield
      visit vouchers_path
    end

    scenario 'is not able to see production data' do
      expect(page).not_to have_content @voucher_production.code
    end

    scenario 'is able to see non production data' do
      expect(page).to have_content @voucher_battlefield.code
    end

    scenario 'is able to see expired data' do
      expect(page).to have_content @voucher_battlefield_expired.code
    end
  end
end
