class RegionLocationsController < ApplicationController
  before_action :find_by_id, only: [:index, :new, :create]

  def index
    @locations = @region.min_koroks(params[:korok_seeds])
  end

  def create
    @region.locations.create!(location_params)
    redirect_to "/regions/#{@region.id}/locations"
  end

  private

  def location_params
    params.permit(:name, :is_cold, :korok_seeds)
  end

  def find_by_id
    @region = Region.find(params[:id])
  end
end
