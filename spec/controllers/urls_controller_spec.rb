require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  let(:original_url) { 'http://lucasrenan.com' }

  let(:valid_attributes) {
    { original_url: original_url }
  }

  let(:invalid_attributes) {
    { original_url: '' }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      url = Url.create! valid_attributes

      get :index

      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    context 'with valid token' do
      it 'redirects to the original url' do
        url = Url.create! valid_attributes

        get :show, params: {token: url.token}

        expect(response).to have_http_status(:moved_permanently)
        expect(response).to redirect_to(url.original_url)
      end
    end

    context 'with invalid token'do
      it 'redirects to the homepage' do
        url = Url.create! valid_attributes

        get :show, params: {token: '1234567'}

        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new shortened url' do
        expect {
          post :create, params: {url: valid_attributes}
        }.to change(Url, :count).by(1)
      end

      it 'redirects to the homepage' do
        post :create, params: {url: valid_attributes}

        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new shortened url' do
        expect {
          post :create, params: {url: invalid_attributes}
        }.to_not change(Url, :count)
      end

      it 'does not redirect' do
        post :create, params: {url: invalid_attributes}

        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested url' do
      url = Url.create! valid_attributes

      expect {
        delete :destroy, params: {id: url.to_param}
      }.to change(Url, :count).by(-1)
    end

    it 'redirects to the homepage' do
      url = Url.create! valid_attributes

      delete :destroy, params: {id: url.to_param}

      expect(response).to redirect_to(root_path)
    end
  end

end
