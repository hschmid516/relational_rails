class LootsController < ApplicationController
  def index
    @loots = Loot.all
  end

  def show
    @loot = Loot.find(params[:id])
  end
end
