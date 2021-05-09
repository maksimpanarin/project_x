# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /users', type: :request do
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
        FactoryBot.create_list(:user, 3)
      end

      it 'returns http success' do
        get url, headers: auth_headers
        expect(response).to have_http_status(:success)
      end

      it 'returns all users' do
        get url, headers: auth_headers
        body = JSON.parse response.body
        expect(body['data'].count).to eq(4)
      end

      it 'users sortered by id' do
        get url, headers: auth_headers
        body = JSON.parse response.body
        expect(body['data'].pluck('id')).to eq(User.order(:id).pluck(:id))
      end

      it 'returns metadata' do
        get url, headers: auth_headers
        body = JSON.parse response.body
        metadata = body['meta']
        expect(metadata['current_page']).to_not be_nil
        expect(metadata['next_page']).to be_nil
        expect(metadata['prev_page']).to be_nil
        expect(metadata['per_page']).to_not be_nil
        expect(metadata['total_pages']).to_not be_nil
        expect(metadata['total_count']).to_not be_nil
      end
    end
  end

  describe 'GET users/:id', type: :request do
    let(:creator) { Fabricate :user }
    let(:headers) do
      {
        ACCEPT: 'application/json'
      }
    end
    let(:url) { '/users/' }
    let(:id) { creator.id.to_s }
    let(:invalid_id) { creator.id.to_s + '1' }
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, creator) }

    it 'returns a user by id' do
      get url + id, headers: auth_headers
      body = JSON.parse response.body
      expect(body['id']).to eq(creator.id)
    end

    it 'returns 404 if user not found' do
      get url + invalid_id, headers: auth_headers
      expect(status).to eq 404
    end
  end
end
