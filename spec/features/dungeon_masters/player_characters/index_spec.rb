require 'rails_helper'

RSpec.describe 'dungeon master and player_character index' do
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    describe 'user story 5' do 
        it 'can show each child with their attributes associated with the parent' do
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(player_name: 'Ed', character_name: 'Bonnet', character_level: 4,character_age: 32, character_class: 'Warlock', character_race: 'Tiefling', is_alive: 'true')
            adventurer2 = lucius.player_characters.create!(player_name: 'Stede', character_name: 'Teach', character_level: 5,character_age: 207, character_class: 'Swashbuckler', character_race: 'Genasi', is_alive: 'true')
            adventurer3 = lucius.player_characters.create!(player_name: 'Izzy', character_name: 'Hands', character_level: 3,character_age: 25, character_class: 'Bard', character_race: 'Half-Elf', is_alive: 'false')
        
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')
            adventurer4 = frenchie.player_characters.create!(player_name: 'Wee John', character_name: 'Gun Powder', character_level: 2,character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: 'true')
            adventurer5 = frenchie.player_characters.create!(player_name: 'Oluwande', character_name: 'Jim', character_level: 3,character_age: 29, character_class: 'Rogue', character_race: 'Human', is_alive: 'true')
        
            visit "/dungeon_masters/#{lucius.id}/player_characters"
            # save_and_open_page
            expect(page).to have_content(lucius.name)
            expect(page).to_not have_content(frenchie.name)
            expect(page).to_not have_content(adventurer4.player_name)
            expect(page).to have_content(adventurer1.player_name)
            expect(page).to have_content(adventurer2.player_name)
            expect(page).to have_content(adventurer3.player_name)
            expect(page).to have_content(adventurer1.character_name)
            expect(page).to have_content(adventurer2.character_name)
            expect(page).to have_content(adventurer3.character_name)
            expect(page).to have_content(adventurer1.character_level)
            expect(page).to have_content(adventurer1.character_age)
            expect(page).to have_content(adventurer1.character_class)
            expect(page).to have_content(adventurer1.character_race)
            expect(page).to have_content(adventurer1.is_alive)
            expect(page).to have_content(adventurer1.created_at)
            expect(page).to have_content(adventurer1.updated_at)
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

    describe 'user story 9' do
        it 'has a link on every page that goes to dungeon_master_index' do
            visit '/dungeon_masters'

            click_link 'Dungeon Masters'
            # save_and_open_page
            expect(current_path).to eq('/dungeon_masters')
        end
    end
end