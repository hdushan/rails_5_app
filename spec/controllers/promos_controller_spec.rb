require 'rails_helper'

RSpec.describe PromosController, type: :controller do
  describe 'GET #index' do
    before do
      allow(Environment).to receive(:all) { [environment] }
      get :index
    end

    let(:promo) { build :promo, code: 'XXX', product: '7GB', environment: false }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
