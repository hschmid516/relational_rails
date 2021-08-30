class RegionsController < ApplicationController
  def index
    @regions = Region.ordered_regions(params[:sort])
  end

  def show
    @region = Region.find(params[:id])
  end

  def new
  end

  def create
    Region.create!(region_params)
    redirect_to "/regions"
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    region = Region.find(params[:id])
    region.update(region_params)
    redirect_to "/regions/#{region.id}"
  end

  def destroy
    Region.destroy(params[:id])
    redirect_to '/regions'
  end

private
  def region_params
    params.permit(:name, :has_divine_beast, :shrines)
  end
end
