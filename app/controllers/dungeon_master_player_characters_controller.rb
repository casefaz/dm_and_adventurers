class DungeonMasterPlayerCharactersController < ApplicationController
    def index
        @dm = DungeonMaster.find(params[:dungeon_master_id])
        @pc = @dm.player_characters
    end

    def new
        @dm = DungeonMaster.find(params[:dungeon_master_id])
    end

    def create
        dm = DungeonMaster.find(params[:dungeon_master_id])
        pc = dm.player_characters.create(pc_params)
        redirect_to "/dungeon_masters/#{dm.id}/player_characters"
    end

    def pc_params
        params.permit(:player_name, :character_name, :character_age, :character_level, :character_class, :character_race, :is_alive)
    end
end