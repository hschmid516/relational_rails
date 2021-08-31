class LootsController < ApplicationController
  def index
    @loots = Loot.exact_search(params[:search_exact]).partial_search(params[:search_partial]).show_true
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

  def destroy
  @loot = Loot.destroy(params[:id])
  redirect_to '/loots'
  end

private
  def loot_params
    params.permit(:name)
  end
end
