class DungeonMaster < ApplicationRecord
    has_many :player_characters

    validates_presence_of :name, :number_of_players, :level_range
    validates :dm_active, inclusion: [true, false]
end