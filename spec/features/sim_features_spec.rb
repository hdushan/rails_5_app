require 'spec_helper'

feature 'Sim Features', js: true do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
  end

  context 'visiting home page' do
    scenario 'redirects to Sims' do
      visit root_path
      expect(page).to have_content 'Sim Number'
    end
  end

  context 'without signing in' do
    before do
      @sim_production = create :sim, sim_number: '111111', environment: @environment_production
      @sim_battlefield = create :sim, sim_number: '222222', environment: @environment_battlefield
      visit sims_path
    end

    scenario 'is able to see production data' do
      expect(page).to have_content @sim_production.sim_number
    end

    scenario 'is able to see non production data' do
      expect(page).to have_content @sim_battlefield.sim_number
    end
  end
end
