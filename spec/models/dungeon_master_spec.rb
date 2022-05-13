require 'rails_helper'

RSpec.describe DungeonMaster, type: :model do
    describe 'relationships' do
        it { should have_many :player_characters }
    end

    describe 'valdiations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :number_of_players }
        it { should validate_presence_of :level_range }
        it { should allow_value(true).for (:dm_active) }
        it { should allow_value(false).for (:dm_active) }
    end

    describe 'class methods' do
        it 'can order by the most recently entered dungeon master' do
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')

            expect(DungeonMaster.most_recent).to eq([frenchie,lucius])
        end
    end 
    describe 'instance methods' do
        it 'can count the number of players per DM' do
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(player_name: 'Ed', character_name: 'Bonnet', character_level: 4,character_age: 32, character_class: 'Warlock', character_race: 'Tiefling', is_alive: 'true')
            adventurer2 = lucius.player_characters.create!(player_name: 'Stede', character_name: 'Teach', character_level: 5,character_age: 207, character_class: 'Swashbuckler', character_race: 'Genasi', is_alive: 'true')
            adventurer3 = lucius.player_characters.create!(player_name: 'Izzy', character_name: 'Hands', character_level: 3,character_age: 25, character_class: 'Bard', character_race: 'Half-Elf', is_alive: 'false')

            expect(lucius.player_count).to eq(3)
        end
    end 
end