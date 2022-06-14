class Api::V1::BreweriesController < ApplicationController
  def index
    list_of_breweries = BreweriesFacade.get_breweries_list(params[:by_city])
  end
end