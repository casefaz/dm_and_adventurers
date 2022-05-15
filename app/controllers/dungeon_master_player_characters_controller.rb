class DungeonMasterPlayerCharactersController < ApplicationController
    def index
        @dm = DungeonMaster.find(params[:dungeon_master_id])
        @pc = @dm.player_characters
    end

    def new
        
    end
end