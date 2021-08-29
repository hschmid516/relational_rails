class WorldBossLootsController < ApplicationController

  def index
    @world_boss = WorldBoss.find(params[:id])
    @loots = @world_boss.sort_loots(params[:sort])
    @loots = @world_boss.min_armor(params[:armor])

  end

  def new
    @world_boss = WorldBoss.find(params[:id])
  end

  def create
    @world_boss = WorldBoss.find(params[:id])
    @world_boss.loots.create(loots_params)
    redirect_to "/world_bosses/#{@world_boss.id}/loots"
  end

private
  def loots_params
    params.permit(:name, :armor, :memory)
  end
end
