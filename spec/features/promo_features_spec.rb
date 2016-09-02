require 'spec_helper'

feature 'Promo Features', js: true do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
  end

  context 'without signing in' do
    before do
      @promo_production = create :promo, code: '111111', environment: @environment_production
      @promo_battlefield = create :promo, code: '222222', environment: @environment_battlefield
      visit promos_path
    end

    scenario 'is not able to see production data' do
      expect(page).not_to have_content @promo_production.code
    end

    scenario 'is able to see non production data' do
      expect(page).to have_content @promo_battlefield.code
    end
  end
end
