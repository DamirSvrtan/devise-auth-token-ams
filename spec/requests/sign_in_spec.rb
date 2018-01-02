require 'rails_helper'

describe 'Sign in', type: :request do
  let(:email) { 'damir@gmail.com' }
  let(:password) { 'pa$$w0rD' }

  let(:user) { User.create!(email: email, password: password) }

  before do
    user
  end

  describe 'valid request' do
    it 'returns 200 status', :dox do
      post '/v1/users/sign_in', params: {
        data: {
          attributes: {
            email: email,
            password: password
          }
        }
      }
      expect(response).to have_http_status(201)
    end
  end

  describe 'invalid request' do
    it 'returns 401 status', :dox do
      post '/v1/users/sign_in', params: {
        data: {
          attributes: {
            email: email,
            password: 'blah'
          }
        }
      }
      expect(response).to have_http_status(401)
    end
  end
end
