class Flight < ApplicationRecord
  def self.find_matching(departure, arrival, tickets, departure_date)
    if departure_date == "" || !departure_date
      departure_date = DateTime.now.to_s
    end
    where(
          "start >= ?", DateTime.parse(departure_date).all_day).where(departure_airport_id: Airport.find_by(code: departure),
          arrival_airport_id: Airport.find_by(code: arrival))
  end
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
end
