require 'spec_helper'

feature 'Visit Home Page', integration: true do
  before do
    # @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    # @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    # @sim_production_1 = create :sim, sim_number: '111111', environment: @environment_production
    # @sim_production_2 = create :sim, sim_number: '222222', environment: @environment_production
    # @sim_battlefield_1 = create :sim, sim_number: '333333', environment: @environment_battlefield
    # @sim_battlefield_2 = create :sim, sim_number: '444444', environment: @environment_battlefield
  end

  scenario 'redirects to Sims' do
    visit root_path
    expect(page).to have_content 'Sim Number'
  end
end
