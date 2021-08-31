class LocationsController < ApplicationController
  def index
    @locations = Location.exact_search(params[:search]).
    partial_search(params[:search_partial])
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    location = Location.find(params[:id])
    location.update(location_params)
    redirect_to "/locations/#{location.id}"
  end

  def destroy
    Location.destroy(params[:id])
    redirect_to '/locations'
  end

private
  def location_params
    params.permit(:name, :is_cold, :korok_seeds)
  end
end
