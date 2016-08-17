require 'rails_helper'

describe PagesController do
  render_views
  describe '#home' do
    before { get :home }
    it { expect(response).to redirect_to(sims_path) }
  end
end
