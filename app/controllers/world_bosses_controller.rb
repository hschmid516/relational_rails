class WorldBossesController < ApplicationController
  def index
    @world_bosses = WorldBoss.ordered_bosses(params[:sort])
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

  def edit
    @world_boss = WorldBoss.find(params[:id])
  end

  def update
    world_boss = WorldBoss.find(params[:id])
    world_boss.update(boss_params)
    redirect_to "/world_bosses/#{world_boss.id}"
  end

  def destroy
  @world_boss = WorldBoss.destroy(params[:id])
  redirect_to '/world_bosses'
  end

private
  def boss_params
    params.permit(:name, :max_health, :zone, :is_current_boss)
  end
end
