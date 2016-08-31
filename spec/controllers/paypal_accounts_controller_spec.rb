require 'rails_helper'

RSpec.describe PaypalAccountsController, type: :controller do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    @paypal_production_1 = create :paypal_account, user_name: '111111', environment: @environment_production
    @paypal_production_2 = create :paypal_account, user_name: '222222', environment: @environment_production
    @paypal_battlefield = create :paypal_account, environment: @environment_battlefield
  end

  describe 'GET #index' do
    subject { assigns(:paypal_accounts) }

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

      it 'returns all paypal accounts' do
        is_expected.to eq([@paypal_production_1, @paypal_production_2, @paypal_battlefield])
      end

      it 'does not show any notice about hidden data' do
        expect(flash[:notice]).not_to be_present
      end
    end

    context 'with user not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?) { false }
        get :index
      end

      it 'returns only non-prod paypal accounts' do
        is_expected.to eq([@paypal_battlefield])
      end

      it 'shows notice about production data hidden' do
        expect(flash[:notice]).to match(/production Paypal Accounts hidden/i)
      end
    end
  end

  describe 'GET #fetch' do
    before do
      get :fetch, params: { environment: 'production', count: '1' }
    end

    subject { assigns(:paypal_accounts) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only data for the specified environment and count' do
      is_expected.to eq([@paypal_production_1])
    end
  end
end
