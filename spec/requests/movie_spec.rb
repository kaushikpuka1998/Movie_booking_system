require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET /movies_by_city" do
    it "returns http success" do
      get "/movie/movies_by_city"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /movie_shows" do
    it "returns http success" do
      get "/movie/movie_shows"
      expect(response).to have_http_status(:success)
    end
  end

end
