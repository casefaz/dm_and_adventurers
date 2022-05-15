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
        dm = DungeonMaster.create(dm_params
            # name: params[:name], 
            # number_of_players: params[:number_of_players], 
            # dm_active: params[:dm_active], 
            # level_range: params[:level_range]
        )
        dm.save
        redirect_to '/dungeon_masters'
    end

    def edit
        # binding.pry
        @dm = DungeonMaster.find(params[:id])
    end

    def update
        # binding.pry
        dm = DungeonMaster.find(params[:id])
        dm.update(dm_params)
        dm.save
        redirect_to "/dungeon_masters/#{dm.id}"
    end

    def dm_params
        # binding.pry
        params.permit(:name, :number_of_players, :dm_active, :level_range)
    end

end