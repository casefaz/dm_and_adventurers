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
            adventurer1 = lucius.player_characters.create!(
                player_name: 'Ed', 
                character_name: 'Bonnet', 
                character_level: 8,
                character_age: 32, 
                character_class: 'Warlock',
                character_race: 'Halfling',
                is_alive: true)
            adventurer2 = lucius.player_characters.create!(
                player_name: 'Stede', 
                character_name: 'Teach', 
                character_level: 8,
                character_age: 207, 
                character_class: 'Swashbuckler', 
                character_race: 'Genasi', 
                is_alive: true)
            adventurer3 = lucius.player_characters.create!(
                player_name: 'Izzy', 
                character_name: 'Hands', 
                character_level: 3,
                character_age: 25, 
                character_class: 'Bard', 
                character_race: 'Half-Elf', 
                is_alive: false)

            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
                adventurer = marcelline.player_characters.create!(
                    player_name: 'Peppermint Butler', 
                    character_name: 'Valor the Just', 
                    character_level: 7,
                    character_age: 207, 
                    character_class: 'Wizard', 
                    character_race: 'Dwarf', 
                    is_alive: true)
                adventurer_3 = marcelline.player_characters.create!(
                    player_name: 'Lemongrab', 
                    character_name: 'Unacceptable', 
                    character_level: 8,
                    character_age: 39, 
                    character_class: 'Cleric', 
                    character_race: 'Human', 
                    is_alive: false)

            expect(lucius.player_count).to eq(3)
            expect(marcelline.player_count).to eq(2)
        end

        it '#pc_filter(params) filters for alphabetical and threshold' do
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(
                player_name: 'Ed', 
                character_name: 'Bonnet', 
                character_level: 8,
                character_age: 32, 
                character_class: 'Warlock',
                character_race: 'Halfling',
                is_alive: true)
            adventurer2 = lucius.player_characters.create!(
                player_name: 'Stede', 
                character_name: 'Teach', 
                character_level: 8,
                character_age: 207, 
                character_class: 'Swashbuckler', 
                character_race: 'Genasi', 
                is_alive: true)
            adventurer3 = lucius.player_characters.create!(
                player_name: 'Izzy', 
                character_name: 'Hands', 
                character_level: 3,
                character_age: 25, 
                character_class: 'Bard', 
                character_race: 'Half-Elf', 
                is_alive: false)

            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(
                player_name: 'Peppermint Butler', 
                character_name: 'Valor the Just', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Wizard', 
                character_race: 'Dwarf', 
                is_alive: true)
            adventurer_3 = marcelline.player_characters.create!(
                player_name: 'Lemongrab', 
                character_name: 'Unacceptable', 
                character_level: 8,
                character_age: 39, 
                character_class: 'Cleric', 
                character_race: 'Human', 
                is_alive: false)

            expect(lucius.pc_filter({sort: true})).to eq([adventurer1, adventurer3, adventurer2])
        end 
    end 
end