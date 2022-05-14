require 'rails_helper'

RSpec.describe 'dm show page', type: :feature do
    describe 'user story 2' do
        # As a visitor
        # When I visit '/parents/:id'
        # Then I see the parent with that id including the parent's attributes:
        # - data from each column that is on the parent table
        it 'can show the attributes of a specific dm' do
            dm = DungeonMaster.create!(name: 'Amethyst', number_of_players: 4, dm_active: true, level_range: 'mid')
            dm_2 = DungeonMaster.create!(name: 'Marcelline', number_of_players: 7, dm_active: true, level_range: 'high')
            dm_3 = DungeonMaster.create!(name: 'Lucius', number_of_players: 5, dm_active: false, level_range: 'low')
            dm_4 = DungeonMaster.create!(name: 'Frenchie', number_of_players: 9, dm_active: true, level_range: 'low')
            
            visit "/dungeon_masters/#{dm.id}"

            # save_and_open_page
            expect(page).to have_content(dm.name)
            expect(page).to_not have_content(dm_2.name)
            expect(page).to have_content(dm.id)
            expect(page).to have_content(dm.number_of_players)
            expect(page).to have_content(dm.dm_active)
            expect(page).to have_content(dm.level_range)
            expect(page).to have_content(dm.created_at)
            expect(page).to have_content(dm.updated_at)
        end
    end 

    describe 'user story 7' do
        it 'can show the number of children associated with the parent' do
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(player_name: 'Ed', character_name: 'Bonnet', character_level: 4,character_age: 32, character_class: 'Warlock', character_race: 'Tiefling', is_alive: 'true')
            adventurer2 = lucius.player_characters.create!(player_name: 'Stede', character_name: 'Teach', character_level: 5,character_age: 207, character_class: 'Swashbuckler', character_race: 'Genasi', is_alive: 'true')
            adventurer3 = lucius.player_characters.create!(player_name: 'Izzy', character_name: 'Hands', character_level: 3,character_age: 25, character_class: 'Bard', character_race: 'Half-Elf', is_alive: 'false')

            visit "/dungeon_masters/#{lucius.id}"
            # save_and_open_page
            expect(page).to have_content(lucius.name)
            expect(page).to have_content("Number of Players: 3")
        end
    end

    describe 'user story 8' do
        it 'has a link that goes to player_character index' do
            visit '/player_characters'

            click_link 'Adventurers'
            # save_and_open_page
            expect(current_path).to eq('/player_characters')
        end
    end

    describe 'user story 10' do
        # As a visitor
        # When I visit a parent show page ('/parents/:id')
        # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
        it 'can link each dm to their players' do
            dm = DungeonMaster.create!(name: "Orville", number_of_players: 4, dm_active: true, level_range: 'high')

            visit "/dungeon_masters/#{dm.id}"

            click_link "#{dm.name}'s Adventurers"

            expect(current_path).to eq("/dungeon_masters/#{dm.id}/player_characters")
        end 
    end
end