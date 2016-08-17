require 'rails_helper'

RSpec.describe DirectDebitsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #fetch' do
    it 'returns http success' do
      get :fetch
      expect(response).to have_http_status(:success)
    end
  end
end
