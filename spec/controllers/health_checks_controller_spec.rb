require 'rails_helper'

describe HealthChecksController do
  describe '#index' do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
    it { expect(response.body).to eq 'Success' }
  end
end
