require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user1@example.com',
        password: 'password'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      result = JSON.parse(response.body)
      expect(result.keys).to match_array(["created_at", "email", "id", "updated_at"])
    end
  end

  context 'when user already exists' do
    before do
      Fabricate :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 422
    end

    it 'returns validation errors' do
      result = JSON.parse(response.body)
      expect(result['errors'].first['message']).to eq('Email has already been taken')
    end
  end
end