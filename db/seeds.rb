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

flight_data = [
  { departure_code: "SFO", arrival_code: "NYC", start: DateTime.new(2024, 3, 25, 8, 0, 0), duration: 360 },
  { departure_code: "KE", arrival_code: "PG", start: DateTime.new(2024, 3, 25, 9, 0, 0), duration: 300 },
  { departure_code: "CA", arrival_code: "BU", start: DateTime.new(2024, 3, 25, 10, 0, 0), duration: 420 },
  # Add more flight data as needed
]

# Create flights using the flight data
flight_data.each do |flight|
  departure_airport = Airport.find_by(code: flight[:departure_code])
  arrival_airport = Airport.find_by(code: flight[:arrival_code])

  Flight.find_or_create_by!(
    departure_airport_id: departure_airport.id,
    arrival_airport_id: arrival_airport.id,
    start: flight[:start],
    duration: flight[:duration]
  )
end
