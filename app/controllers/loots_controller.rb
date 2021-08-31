class LootsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit, :update]

  def index
    @loots = Loot.exact_search(params[:search_exact]).partial_search(params[:search_partial]).show_true
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

  def find_by_id
    @loot = Loot.find(params[:id])
  end
end
