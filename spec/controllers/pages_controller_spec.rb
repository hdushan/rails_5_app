require 'rails_helper'

describe PagesController do
  render_views
  describe '#home' do
    before { get :home }
    it { expect(response).to have_http_status(:success) }
    it { expect(response.body).to include 'Work in progress' }
  end
end
