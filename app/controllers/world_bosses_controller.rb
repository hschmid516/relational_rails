class WorldBossesController < ApplicationController
  def index
    @world_bosses = WorldBoss.ordered_bosses
  end

  def show
    @world_boss = WorldBoss.find(params[:id])
  end

  def loots_index #make a new controller for this
    @world_boss = WorldBoss.find(params[:id])
    @loots = Loot.where(world_boss_id: @world_boss.id)
  end
end
