require 'rails_helper'

RSpec.describe "Weathers", type: :request do

  let!(:forecast) { Forecast.create(temperature: 0.419e2, epoch_time: "Mon, 30 Jan 2023 22:06:00.000000000 UTC +03:00") }

  describe "Response success" do
    it "returns http success" do
      get "/weather/historical/min"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/weather/historical/max"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/weather/historical/avg"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/weather/by_time?timestamp=#{forecast.epoch_time.to_i + 10800}"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/weather/by_time?timestamp=#{forecast.epoch_time.to_i + 10801}"
      expect(response).to have_http_status(:not_found)
    end

    it "returns 404 success" do
      get "/weather/by_time"
      expect(response).to have_http_status(:not_found)
    end

    it "returns http success" do
      get "/weather/historical"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/weather/current"
      expect(response).to have_http_status(:success)
    end

    it "returns http success" do
      get "/health"
      expect(response).to have_http_status(:success)
    end
  end
end