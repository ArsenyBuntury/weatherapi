Rails.application.routes.draw do
  get "/weather/current", to: "weather#current"
  get "/weather/historical", to: "weather#historical"
  get "/weather/historical/max", to: "weather#historical_max"
  get "/weather/historical/min", to: "weather#historical_min"
  get "/weather/historical/avg", to: "weather#historical_avg"
  get "/weather/by_time", to: "weather#by_time"

  get :health, to: proc {  [200, {}, ["Ok"]] }
end
