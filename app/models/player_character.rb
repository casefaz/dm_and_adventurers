class PlayerCharacter < ApplicationRecord
    belongs_to :dungeon_master

    validates_presence_of :player_name, :character_name, :character_age, :character_level, :character_class, :character_race
    validates :is_alive, inclusion: [true, false]
    
    def self.dead_or_alive
        where(is_alive: true)
    end

    def self.alphabetical_order
        order(Arel.sql("lower(player_name)"))
        # order(:player_name)
    end

    def self.level_threshold(threshold)
        where("character_level > ?", threshold)
    end

    def self.filter_by(params)
        # binding.pry
        if params[:sort] 
            alphabetical_order
        # elsif params[:sort]&& params[:threshold]
        #     level_threshold(params[:threshold]).
        #     alphabetical_order
        elsif params[:threshold]
            level_threshold(params[:threshold])
        else
            all
        end
    end
end