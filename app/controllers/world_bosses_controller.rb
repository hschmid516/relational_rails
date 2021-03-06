class WorldBossesController < ApplicationController
  before_action :find_by_id, only: %i[show edit update]
  def index
    @world_bosses = WorldBoss.exact_search(params[:search_exact])
                            .partial_search(params[:search_partial])
                            .ordered_bosses(params[:sort])
  end

  def create
    world_boss = WorldBoss.create(boss_params)
    redirect_to '/world_bosses'
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

  def find_by_id
    @world_boss = WorldBoss.find(params[:id])
  end
end
