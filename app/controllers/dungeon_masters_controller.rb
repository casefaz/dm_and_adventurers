class DungeonMastersController < ApplicationController
    def index
        @dm = DungeonMaster.most_recent
    end

    def show
        @dm = DungeonMaster.find(params[:id])
    end

    def new
    end

    def create
        dm = DungeonMaster.create(dm_params
            # name: params[:name], 
            # number_of_players: params[:number_of_players], 
            # dm_active: params[:dm_active], 
            # level_range: params[:level_range]
        )
        redirect_to '/dungeon_masters'
    end

    def edit
        # @dm = DungeonMaster.find(params[:id])
        @dm_id = params[:id]
    end

    def update
        dm = DungeonMaster.find(params[:id])
        dm.update!(dm_params)
        redirect_to "/dungeon_masters/#{dm.id}"
    end

    def destroy
        dm = DungeonMaster.find(params[:id])
        dm.player_characters.destroy_all
        dm.destroy
        redirect_to '/dungeon_masters'
    end

    private
    
        def dm_params
            params.permit(:name, :number_of_players, :dm_active, :level_range)
        end

end