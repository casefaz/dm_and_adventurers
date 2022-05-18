require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
    describe 'relationships' do
        it {should belong_to :dungeon_master}
    end

    describe 'validations' do
        it { should validate_presence_of :player_name }
        it { should validate_presence_of :character_name }
        it { should validate_presence_of :character_age }
        it { should validate_presence_of :character_level }
        it { should validate_presence_of :character_class }
        it { should validate_presence_of :character_race }
        it { should allow_value(true).for(:is_alive) }
        it { should allow_value(false).for(:is_alive) }
    end

    describe 'class methods' do 
        # As a visitor
        # When I visit the child index
        # Then I only see records where the boolean column is `true`
        it 'can show only not dead adventurers' do
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(
                player_name: 'Peppermint Butler', 
                character_name: 'Valor the Just', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Wizard', 
                character_race: 'Dwarf', 
                is_alive: true)
            adventurer_2 = marcelline.player_characters.create!(
                player_name: 'Beemo', 
                character_name: 'Rainbow Butterfly', 
                character_level: 8,
                character_age: 39, 
                character_class: 'Artificer', 
                character_race: 'Halfling', 
                is_alive: true)
            adventurer_3 = marcelline.player_characters.create!(player_name: 'Lemongrab', character_name: 'Unacceptable', character_level: 8,character_age: 39, character_class: 'Cleric', character_race: 'Human', is_alive: false)

            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(
                player_name: 'Ed', 
                character_name: 'Bonnet', 
                character_level: 4,
                character_age: 32, 
                character_class: 'Warlock', 
                character_race: 'Tiefling', 
                is_alive: 'true')
            adventurer2 = lucius.player_characters.create!(
                player_name: 'Stede', 
                character_name: 'Teach', 
                character_level: 5,
                character_age: 207, 
                character_class: 'Swashbuckler', 
                character_race: 'Genasi', 
                is_alive: 'true')
            adventurer3 = lucius.player_characters.create!(
                player_name: 'Izzy', 
                character_name: 'Hands', 
                character_level: 3,
                character_age: 25, 
                character_class: 'Bard', 
                character_race: 'Half-Elf', 
                is_alive: 'false')

            expect(PlayerCharacter.dead_or_alive).to eq([adventurer, adventurer_2, adventurer1, adventurer2])
            
        end

        it 'can sort alphabetically' do 
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(
                player_name: 'Peppermint Butler', 
                character_name: 'Valor the Just', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Wizard', 
                character_race: 'Dwarf', 
                is_alive: true)
            adventurer_2 = marcelline.player_characters.create!(
                player_name: 'Beemo', 
                character_name: 'Rainbow Butterfly', 
                character_level: 8,character_age: 39, 
                character_class: 'Artificer', 
                character_race: 'Halfling', 
                is_alive: true)
            adventurer_3 = marcelline.player_characters.create!(
                player_name: 'Lemongrab', 
                character_name: 'Unacceptable', 
                character_level: 8,
                character_age: 39, 
                character_class: 'Cleric', 
                character_race: 'Human', 
                is_alive: false)

            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(
                player_name: 'Ed', 
                character_name: 'Bonnet', 
                character_level: 4,
                character_age: 32, 
                character_class: 'Warlock', 
                character_race: 'Tiefling', 
                is_alive: true)
            adventurer2 = lucius.player_characters.create!(
                player_name: 'Stede', 
                character_name: 'Teach', 
                character_level: 5,
                character_age: 207, 
                character_class: 'Swashbuckler', 
                character_race: 'Genasi', 
                is_alive: true)
            

            expect(PlayerCharacter.alphabetical_order).to eq([adventurer_2, adventurer1, adventurer_3, adventurer, adventurer2])
        end

        it 'can only show characters with levels above a threshold' do 
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(
                player_name: 'Peppermint Butler', 
                character_name: 'Valor the Just', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Wizard', 
                character_race: 'Dwarf', 
                is_alive: true)
            adventurer_2 = marcelline.player_characters.create!(
                player_name: 'Beemo', 
                character_name: 'Rainbow Butterfly', 
                character_level: 8,
                character_age: 39, 
                character_class: 'Artificer', 
                character_race: 'Halfling', 
                is_alive: true)
            adventurer_3 = marcelline.player_characters.create!(
                player_name: 'Lemongrab', 
                character_name: 'Unacceptable', 
                character_level: 8,
                character_age: 39, 
                character_class: 'Cleric', 
                character_race: 'Human', 
                is_alive: false)

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

            expect(PlayerCharacter.level_threshold(7)).to eq([adventurer_2, adventurer_3, adventurer1, adventurer2])
        end
    end
end