require 'rails_helper'

RSpec.describe 'dm index page', type: :feature do
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    it 'can see the names of all the dms in the system' do
        dm = DungeonMaster.create!(name: 'Ezra', number_of_players: 4, dm_active: true, level_range: 'mid')
        dm_2 = DungeonMaster.create!(name: 'Mai', number_of_players: 7, dm_active: true, level_range: 'high')
        dm_3 = DungeonMaster.create!(name: 'Kai', number_of_players: 5, dm_active: false, level_range: 'low')
        dm_4 = DungeonMaster.create!(name: 'Lorelai', number_of_players: 9, dm_active: true, level_range: 'low')
        
        visit '/dungeon_masters'
        # save_and_open_page
        expect(page).to have_content(dm.name)
        expect(page).to have_content(dm_2.name)
        expect(page).to have_content(dm_3.name)
        expect(page).to have_content(dm_4.name)
    end

    describe 'user story 6' do 
        # As a visitor
        # When I visit the parent index,
        # I see that records are ordered by most recently created first
        # And next to each of the records I see when it was created
        it 'can order the records that appear on the parent index' do
            lucius = DungeonMaster.create!(name: 'Lucius',number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(player_name: 'Ed', character_name: 'Bonnet', character_level: 4,character_age: 32, character_class: 'Warlock', character_race: 'Tiefling', is_alive: 'true')
            adventurer2 = lucius.player_characters.create!(player_name: 'Stede', character_name: 'Teach', character_level: 5,character_age: 207, character_class: 'Swashbuckler', character_race: 'Genasi', is_alive: 'true')
            adventurer3 = lucius.player_characters.create!(player_name: 'Izzy', character_name: 'Hands', character_level: 3,character_age: 25, character_class: 'Bard', character_race: 'Half-Elf', is_alive: 'false')
        
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')
            adventurer4 = frenchie.player_characters.create!(player_name: 'Wee John', character_name: 'Gun Powder', character_level: 2,character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: 'true')
            adventurer5 = frenchie.player_characters.create!(player_name: 'Oluwande', character_name: 'Jim', character_level: 3,character_age: 29, character_class: 'Rogue', character_race: 'Human', is_alive: 'true')

            visit "/dungeon_masters"

            expect('Frenchie').to appear_before('Lucius')
        end
    end
end