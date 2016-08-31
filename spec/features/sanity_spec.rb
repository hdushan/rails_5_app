require 'spec_helper'

feature 'Visit Home Page', integration: true do
  scenario 'redirects to Sims' do
    visit root_path
    expect(page).to have_content 'Sim Number'
  end
end
