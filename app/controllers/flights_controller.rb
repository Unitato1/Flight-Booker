class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map{ |a| [a.code, a.id]}
    @dates = Flight.all.map{ |f| [f.start.strftime("%m/%d/%Y"), f.id]}
  end
end
