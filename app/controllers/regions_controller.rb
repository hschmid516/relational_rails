class RegionsController < ApplicationController
  def index
    @regions = Region.all
  end

  def show
    @region = Region.find(params[:id])
  end

  def locations_index
    @region = Region.find(params[:id])
    @locations = Location.where(region_id: @region.id)
  end
end
