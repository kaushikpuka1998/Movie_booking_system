require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies_by_city" do
    it "returns http success" do
      get "/movies_by_city/735101"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /movie_shows" do
    it "returns http success" do
      get "/movie_shows/2"
      expect(response).to have_http_status(:success)
    end
  end

end
