class FlightsController < ApplicationController
  def index

    @flights = Flight.find_matching(params[:departure_airport_code], params[:arrival_airport_code], params[:num_tickets], params[:departure_date])
    if !(@flights)
      @flights = Flight.all
    end
    @airports = Airport.all.map{ |a| [a.code, a.code]}
    @dates = Flight.all.map{ |f| [f.start.strftime("%m/%d/%Y %H:%M"), f.start]}
  end
  private
  def search_params
    params.permit(:departure_airport_code, :arrival_airport_code, :num_tickets, :departure_date)
  end
end
