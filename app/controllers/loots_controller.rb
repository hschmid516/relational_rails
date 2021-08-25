class LootsController < ApplicationController
  def index
    @loots = Loot.all
  end
end
