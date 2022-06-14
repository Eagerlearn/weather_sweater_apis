class Api::V1::BreweriesController < ApplicationController
  def index
    list_of_breweries = BreweriesFacade.get_breweries_list(params[:by_city], params[:per_page])

    render json: BreweriesSerializer.breweries_list_by_city(breweries[0])
  end
end