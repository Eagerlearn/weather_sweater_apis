class Api::V1::RoadTripsController < ApplicationController
  def create
    registered_user = User.find_by(api_key: roadtrip_params[:api_key])

    registered_user.present? && params[:origin].present? && params[:destination].present?
    road_trip = RoadTripFacade.get_roadtrip_details(params[:origin], params[:destination])

    render json: RoadTripSerializer.serialized_road_trip(road_trip), status: 201
    # key = {api_key: SecureRandom.hex(13)}
    # actual_road_trip = RoadTrip.create!(roadtrip_params.merge(key))

    # require "pry"; binding.pry
  end

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end
end