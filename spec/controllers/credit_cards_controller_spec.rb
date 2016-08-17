require 'rails_helper'

RSpec.describe CreditCardsController, type: :controller do
  describe 'GET #index' do
    # let(:environment) { build :environment, name: 'MyEnv', url: 'http://myenv', is_prod_data: false }
    # let(:credit_card) { build :credit_card, card_number: '12345', cvv: '999', environment: environment }

    before do
      # allow(Environment).to receive(:all) { Environment.where(id: [environment].map(&:id)) }
      # allow(CreditCard).to receive(:all) { CreditCard.where(id: [credit_card].map(&:id)) }
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    xit 'sets up environments correctly' do
      expect(assigns(:credit_cards)).to eq([credit_card])
    end
  end

  describe 'GET #fetch' do
    it 'returns http success' do
      get :fetch
      expect(response).to have_http_status(:success)
    end
  end
end
