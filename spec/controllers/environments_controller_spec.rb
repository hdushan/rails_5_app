require 'rails_helper'

RSpec.describe EnvironmentsController, type: :controller do
  describe 'GET #index' do
    let(:environment) { build :environment, name: 'MyEnv', url: 'http://myenv', is_prod_data: false }

    before do
      allow(Environment).to receive(:all) { [environment] }
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'sets up environments correctly' do
      expect(assigns(:environments)).to eq([environment])
    end
  end
end
