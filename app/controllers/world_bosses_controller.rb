class WorldBossesController < ApplicationController
  def index
    @world_bosses = WorldBoss.all
  end
end
