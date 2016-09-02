require 'spec_helper'

feature 'Credit Card Features', js: true do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
  end

  context 'without signing in' do
    before do
      @credit_card_production = create :credit_card, card_number: '1111111111111111', environment: @environment_production
      @credit_card_battlefield = create :credit_card, card_number: '2222222222222222', environment: @environment_battlefield
      visit credit_cards_path
    end

    scenario 'is not able to see production data' do
      expect(page).not_to have_content @credit_card_production.card_number
    end

    scenario 'is able to see non production data' do
      expect(page).to have_content @credit_card_battlefield.card_number
    end
  end
end
