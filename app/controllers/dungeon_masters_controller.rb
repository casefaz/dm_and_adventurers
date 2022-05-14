class DungeonMastersController < ApplicationController
    def index
            # binding.pry
        @dm = DungeonMaster.most_recent
    end

    def show
        # binding.pry
        @dm = DungeonMaster.find(params[:id])
    end

    def new
    end

    def create
    #    binding.pry
        DungeonMaster.create!(dm_params
            # name: params[:name], 
            # number_of_players: params[:number_of_players], 
            # dm_active: params[:dm_active], 
            # level_range: params[:level_range]
        )
        redirect_to '/dungeon_masters'
    end

    def dm_params
        # binding.pry
        params.permit(:name, :number_of_players, :dm_active, :level_range)
    end
end