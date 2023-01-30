namespace :accuweather do
  desc "Data from Accuweather"
  task import: :environment do
    AccuweatherConnectService.call
  end
end