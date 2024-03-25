class FlightsController < ApplicationController
  def index
    puts search_params
    @flights = Flight.all
    @airports = Airport.all.map{ |a| [a.code, a.code]}
    @dates = Flight.all.map{ |f| [f.start.strftime("%m/%d/%Y"), f.start]}
  end
  private
  def search_params
    params.permit(:departure_airport_id, :arrival_airport_id, :departure_date, :arrival_date)
  end
end
