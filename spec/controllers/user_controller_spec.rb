require 'rails_helper'

RSpec.describe 'GET /users', type: :request do
  let(:creator) { Fabricate :user }
  let(:headers) do
     {
       ACCEPT: 'application/json'
     }
  end
  let(:url) { '/users' }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, creator) }

  context 'when other users exist' do
    let!(:users) do
      FactoryBot.create_list(:user,3)
    end

    it 'returns all users' do
      get url, headers: auth_headers

      expect(response_body.count).to eq(4)
    end

  # describe 'POST /users/id', type: :request do
  #
  # it 'returns 404 if user not found'

  end
end
