require 'spec_helper'

feature 'Direct Debit Features', js: true do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
  end

  context 'without signing in' do
    before do
      @direct_debit_production = create :direct_debit, account_number: '111111', environment: @environment_production
      @direct_debit_battlefield = create :direct_debit, account_number: '222222', environment: @environment_battlefield
      visit direct_debits_path
    end

    scenario 'is not able to see production data' do
      expect(page).not_to have_content @direct_debit_production.account_number
    end

    scenario 'is able to see non production data' do
      expect(page).to have_content @direct_debit_battlefield.account_number
    end
  end
end
