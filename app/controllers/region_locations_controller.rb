class RegionLocationsController < ApplicationController
  def index
    @region = Region.find(params[:id])
    @locations = @region.locations
  end
end
