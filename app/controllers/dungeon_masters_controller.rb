class DungeonMastersController < ApplicationController
    def index
            # binding.pry
        @dm = DungeonMaster.all
    end

    def show
        
    end
end