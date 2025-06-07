require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new subscriber' do
      get :new
      expect(assigns(:subscriber)).to be_a_new(Subscriber)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          subscriber: {
            name: 'John Doe'
          }
        }
      end

      it 'creates a new subscriber' do
        expect {
          post :create, params: valid_params
        }.to change(Subscriber, :count).by(1)
      end

      it 'redirects to the subscribers index' do
        post :create, params: valid_params
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { subscriber: { name: '' } } }

      it 'does not create a new subscriber' do
        post :create, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end
end
