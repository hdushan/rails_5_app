require 'rails_helper'

RSpec.describe VouchersController, type: :controller do
  before do
    @environment_production = create :environment, name: 'production', url: 'http://production', is_prod_data: true
    @environment_battlefield = create :environment, name: 'battlefield', url: 'http://battlefield', is_prod_data: false
    @voucher_production_1 = create :voucher, code: '111111', expiry_date: Date.today + 1, environment: @environment_production
    @voucher_production_2 = create :voucher, code: '222222', expiry_date: Date.today + 1, environment: @environment_production
    @voucher_production_expired = create :voucher, code: '333333', expiry_date: Date.today - 1, environment: @environment_production
    @voucher_battlefield = create :voucher, expiry_date: Date.today + 1, environment: @environment_battlefield
  end

  describe 'GET #index' do
    subject { assigns(:vouchers) }

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

      it 'returns all vouchers including expired ones' do
        is_expected.to eq([@voucher_production_1, @voucher_production_2, @voucher_production_expired, @voucher_battlefield])
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

      it 'returns only non-prod vouchers' do
        is_expected.to eq([@voucher_battlefield])
      end

      it 'shows notice about production data hidden' do
        expect(flash[:notice]).to match(/production Vouchers hidden/i)
      end
    end
  end

  describe 'GET #fetch' do
    before do
      get :fetch, params: { environment: 'production', count: '1' }
    end

    subject { assigns(:vouchers) }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only data for the specified environment and count' do
      is_expected.to eq([@voucher_production_1])
    end

    it 'returns only unexpired vouchers' do
      is_expected.not_to include(@voucher_production_expired)
    end
  end
end
