class DungeonMaster < ApplicationRecord
    has_many :player_characters

    validates_presence_of :name, :number_of_players, :level_range
    validates :dm_active, inclusion: [true, false]

    def self.most_recent
        order(created_at: :desc)
    end

    def player_count
        player_characters.count
    end

    def pc_filter(params)
        player_characters.filter_by(params)
    end
end