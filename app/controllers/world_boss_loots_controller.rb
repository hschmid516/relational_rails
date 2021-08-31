class WorldBossLootsController < ApplicationController
  before_action :find_by_id, only: [:index, :new, :create]

  def index
    @loots = @world_boss.sort_loots(params[:sort])
  end

  def create
    @world_boss.loots.create(loots_params)
    redirect_to "/world_bosses/#{@world_boss.id}/loots"
  end

private
  def loots_params
    params.permit(:name, :armor, :memory)
  end

  def find_by_id
    @world_boss = WorldBoss.find(params[:id])
  end
end
