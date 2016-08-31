require 'rails_helper'

RSpec.describe SimsController, type: :controller do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    @sim_production_1 = create :sim, sim_number: '111111', environment: @environment_production
    @sim_production_2 = create :sim, sim_number: '222222', environment: @environment_production
    @sim_battlefield = create :sim, environment: @environment_battlefield
  end

  describe 'GET #index' do
    subject { assigns(:sims) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'paginates the result' do
      get :index
      expect(subject.total_pages).to eq(1)
    end

    context 'with user signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { true }
        get :index
      end

      it 'returns prod and non-prod sims' do
        is_expected.to eq([@sim_production_1, @sim_production_2, @sim_battlefield])
      end
    end

    context 'with user not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { false }
        get :index
      end

      it 'returns prod and non-prod sims' do
        is_expected.to eq([@sim_production_1, @sim_production_2, @sim_battlefield])
      end
    end
  end

  describe 'GET #fetch' do
    before do
      get :fetch, params: { reserved_by: 'Test', environment: 'production', count: '1' }
    end

    subject { assigns(:sims) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only data for the specified environment and count' do
      is_expected.to eq([@sim_production_1])
    end
  end
end
