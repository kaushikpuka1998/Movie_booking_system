require 'rails_helper'

describe UserController do
  context "check" do
    it "should return true" do
      expect(true).to eq(true)
    end
  end
end

RSpec.describe 'Create Users', type: :request do
  describe "POST /signup" do
    let(:valid_params) do
      {
        email: "kaushik@example.com",
        phone: "9932834578",
        password: "password",
        password_confirmation: "password"
      }
    end

    it 'creates a new user' do
      puts "User count before: #{User.count}"
      expect do
        post "/signup", params: valid_params
      end.to change(User, :count).by(1)
      puts "User count after: #{User.count}"
    end

    it 'returns a success response' do
      headers = { "ACCEPT" => 'application/json' }
      post '/signup', params: valid_params, headers: headers
      expect(response).to have_http_status(:ok)
    end

    context "with invalid parameters" do
      let(:invalid_params) do
        {
          email: "test@example.com",
          phone: "1234567890",
          password: "password",
          password_confirmation: "wrong_password"
        }
      end

      it "does not create a new user" do
        expect do
          post "/signup", params: invalid_params
        end.to_not change(User, :count)
      end

      it "returns an error response" do
        post "/signup", params: invalid_params
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
