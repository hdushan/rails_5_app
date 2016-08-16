require 'rails_helper'

RSpec.describe VouchersController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'paginates the result' do
      expect(assigns(:vouchers).total_pages).to eq(1)
    end
  end
end
