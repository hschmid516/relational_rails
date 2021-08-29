class LootsController < ApplicationController
  def index
    @loots = Loot.show_true
  end

  def show
    @loot = Loot.find(params[:id])
  end

  def edit
    @loot = Loot.find(params[:id])
  end

  def update
    loot = Loot.find(params[:id])
    loot.update(loot_params)
    redirect_to "/loots/#{loot.id}"
  end



private
  def loot_params
    params.permit(:name)
  end
end
