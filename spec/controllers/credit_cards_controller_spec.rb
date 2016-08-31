require 'rails_helper'

RSpec.describe CreditCardsController, type: :controller do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    @credit_card_production_1 = create :credit_card, card_number: '1111111111111111', environment: @environment_production
    @credit_card_production_2 = create :credit_card, card_number: '2222222222222222', environment: @environment_production
    @credit_card_battlefield = create :credit_card, environment: @environment_battlefield
  end

  describe 'GET #index' do
    subject { assigns(:credit_cards) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'with user signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { true }
        get :index
      end

      it 'returns all credit cards' do
        is_expected.to eq([@credit_card_production_1, @credit_card_production_2, @credit_card_battlefield])
      end
    end

    context 'with user not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { false }
        get :index
      end

      it 'returns only non-prod credit cards' do
        is_expected.to eq([@credit_card_battlefield])
      end
    end
  end

  describe 'GET #fetch' do
    before do
      get :fetch, params: { environment: 'production', count: '1' }
    end

    subject { assigns(:credit_cards) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only data for the specified environment and count' do
      is_expected.to eq([@credit_card_production_1])
    end
  end
end
