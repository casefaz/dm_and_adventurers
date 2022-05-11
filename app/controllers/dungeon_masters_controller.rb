class DungeonMastersController < ApplicationController
    def index
        @dungeon_masters = ['dungeon_master1', 'dungeon_master2', 'dungeon_master3']
    end
end