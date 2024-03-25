class Flight < ApplicationRecord
  def find_matching(departure, arival, departure_date, arival_date)
    where(departure_airport_id: departure)
  end
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
end
