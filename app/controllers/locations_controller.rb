class LocationsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update]

  def index
    @locations = Location.exact_search(params[:search]).partial_search(params[:search_partial])
  end

  def update
    @location.update(location_params)
    redirect_to "/locations/#{@location.id}"
  end

  def destroy
    Location.destroy(params[:id])
    redirect_to '/locations'
  end

  private

  def location_params
    params.permit(:name, :is_cold, :korok_seeds)
  end

  def find_by_id
    @location = Location.find(params[:id])
  end
end
