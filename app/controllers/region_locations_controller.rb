class RegionLocationsController < ApplicationController
  def index
    @region = Region.find(params[:id])
    @locations = @region.locations
  end

  def new
    @region = Region.find(params[:id])
  end

  def create
    @region = Region.find(params[:id])
    @region.locations.create!(location_params)
    redirect_to "/regions/#{@region.id}/locations"
  end

private
  def location_params
    params.permit(:name, :is_cold, :korok_seeds)
  end
end
