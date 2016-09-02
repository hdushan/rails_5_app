require 'spec_helper'

feature 'Paypal Features', js: true do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
  end

  context 'without signing in' do
    before do
      @paypal_production = create :paypal_account, user_name: '111111', environment: @environment_production
      @paypal_battlefield = create :paypal_account, user_name: '222222', environment: @environment_battlefield
      visit paypal_accounts_path
    end

    scenario 'is not able to see production data' do
      expect(page).not_to have_content @paypal_production.user_name
    end

    scenario 'is able to see non production data' do
      expect(page).to have_content @paypal_battlefield.user_name
    end
  end
end
