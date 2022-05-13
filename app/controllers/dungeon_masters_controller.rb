class DungeonMastersController < ApplicationController
    def index
            # binding.pry
        @dm = DungeonMaster.all.most_recent
    end

    def show
        # binding.pry
        @dm = DungeonMaster.find(params[:id])
    end
end