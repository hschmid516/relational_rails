class RegionsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update]

  def index
    @regions = Region.exact_search(params[:search]).
    partial_search(params[:search_partial]).ordered_regions(params[:sort])
  end

  def create
    Region.create!(region_params)
    redirect_to "/regions"
  end

  def update
    @region.update(region_params)
    redirect_to "/regions/#{@region.id}"
  end

  def destroy
    Region.destroy(params[:id])
    redirect_to '/regions'
  end

private
  def region_params
    params.permit(:name, :has_divine_beast, :shrines)
  end

  def find_by_id
    @region = Region.find(params[:id])
  end
end
