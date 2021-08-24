class WorldBossesController < ApplicationController
  def index
    @world_bosses = WorldBoss.all
  end

  def show
    @world_boss = WorldBoss.find(params[:id])
  end
end
