# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
["SFO", "NYC", "KE", "PG", "CA", "BU", "FA"].each do |code|
  Airport.find_or_create_by!(code: code)
end

departure_codes = ["SFO", "KE", "CA", "NYC", "PG", "BU","NYC", "PG", "BU", "SFO", "KE", "CA"]
arrival_codes = ["NYC", "PG", "BU", "SFO", "KE", "CA","SFO", "KE", "CA", "NYC", "PG", "BU"]

# Create 20 flight records with unique data
100.times do |i|
  departure_code = departure_codes.sample # Cycle through departure codes
  arrival_code = arrival_codes.sample # Cycle through arrival codes
  start_time = Date.today # Increment start time for each flight
  duration = i * 60 # Vary duration for each flight

  departure_airport = Airport.find_by(code: departure_code)
  arrival_airport = Airport.find_by(code: arrival_code)

  Flight.find_or_create_by!(
    departure_airport_id: departure_airport.id,
    arrival_airport_id: arrival_airport.id,
    start: start_time,
    duration: duration
  )
end
