require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { topic: { name: 'New Topic' } } }

      it 'creates a new topic' do
        post :create, params: valid_params
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to be_present
      end

      it 'redirects to the topics index' do
        post :create, params: valid_params
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { topic: { name: '' } } }

      it 'does not create a new topic' do
        post :create, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end
end
