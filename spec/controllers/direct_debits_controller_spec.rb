require 'rails_helper'

RSpec.describe DirectDebitsController, type: :controller do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    @direct_debit_production_1 = create :direct_debit, account_number: '111111', environment: @environment_production
    @direct_debit_production_2 = create :direct_debit, account_number: '222222', environment: @environment_production
    @direct_debit_battlefield = create :direct_debit, environment: @environment_battlefield
  end

  describe 'GET #index' do
    subject { assigns(:direct_debits) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    context 'with user signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { true }
        get :index
      end

      it 'returns all direct debits' do
        is_expected.to eq([@direct_debit_production_1, @direct_debit_production_2, @direct_debit_battlefield])
      end
    end

    context 'with user not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { false }
        get :index
      end

      it 'returns only non-prod direct debits' do
        is_expected.to eq([@direct_debit_battlefield])
      end
    end
  end

  describe 'GET #fetch' do
    before do
      get :fetch, params: { environment: 'production', count: '1' }
    end

    subject { assigns(:direct_debits) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only data for the specified environment and count' do
      is_expected.to eq([@direct_debit_production_1])
    end
  end
end
