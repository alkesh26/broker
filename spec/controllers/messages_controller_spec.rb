require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'POST #create' do
    let(:topic) { create(:topic) }

    context 'with valid parameters' do
      let(:valid_params) do
        {
          message: {
            topic_id: topic.id,
            publisher_name: 'John Doe',
            content: 'Test message content'
          }
        }
      end

      it 'creates a new message' do
        post :create, params: valid_params
        expect(response).to be_successful

        message = Message.find_by(topic_id: topic.id, publisher_name: 'John Doe', content: 'Test message content')
        expect(message).to be_present
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        {
          message: {
            topic_id: topic.id,
            publisher_name: '',
            content: ''
          }
        }
      end

      it 'does not create a new message' do
        post :create, params: invalid_params
        expect(flash[:error]).to be_present
      end
    end
  end
end 