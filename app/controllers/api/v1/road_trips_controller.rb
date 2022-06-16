class Api::V1::RoadTripsController < ApplicationController
  def create
    road_trip = RoadTripFacade.get_roadtrip_details(params[:origin], params[:destination])
  end
end