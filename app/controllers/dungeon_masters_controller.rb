class DungeonMastersController < ApplicationController
    def index
            # binding.pry
        @dm = DungeonMaster.all
    end

    def show
        # binding.pry
        @dm = DungeonMaster.find(params[:id])
    end
end