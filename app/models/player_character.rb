class PlayerCharacter < ApplicationRecord
    belongs_to :dungeon_master

    validates_presence_of :player_name, :character_name, :character_age, :character_level, :character_class, :character_race
    validates :is_alive, inclusion: [true, false]
end