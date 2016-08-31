require 'rails_helper'

RSpec.describe PromosController, type: :controller do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    @promo_production_1 = create :promo, code: '111111', environment: @environment_production
    @promo_production_2 = create :promo, code: '222222', environment: @environment_production
    @promo_battlefield = create :promo, environment: @environment_battlefield
  end

  describe 'GET #index' do
    subject { assigns(:promos) }

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

      it 'returns all promos' do
        is_expected.to eq([@promo_production_1, @promo_production_2, @promo_battlefield])
      end
    end

    context 'with user not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { false }
        get :index
      end

      it 'returns only non-prod promos' do
        is_expected.to eq([@promo_battlefield])
      end
    end
  end

  describe 'GET #fetch' do
    before do
      get :fetch, params: { environment: 'production', count: '1' }
    end

    subject { assigns(:promos) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only data for the specified environment and count' do
      is_expected.to eq([@promo_production_1])
    end
  end
end
