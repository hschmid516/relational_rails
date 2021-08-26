class RegionsController < ApplicationController
  def index
    @regions = Region.ordered_regions
  end

  def show
    @region = Region.find(params[:id])
  end
end
