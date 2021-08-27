class WorldBossesController < ApplicationController
  def index
    @world_bosses = WorldBoss.ordered_bosses
  end

  def show
    @world_boss = WorldBoss.find(params[:id])
  end

  def new
  end

  def create
    world_boss = WorldBoss.create(boss_params)
    redirect_to '/world_bosses'
  end

private
  def boss_params
    params.permit(:name)
  end
end
