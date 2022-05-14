require 'rails_helper'

RSpec.describe 'adventurer index', type: :feature do
    describe 'user story 3' do 
        it 'can present each adventurer with its attributes' do
            # As a visitor
            # When I visit '/child_table_name'
            # Then I see each Child in the system including the Child's attributes:
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: 'true', level_range: 'mid')
            adventurer = marcelline.player_characters.create!(player_name: 'Peppermint Butler', character_name: 'Onion', character_level: 7,character_age: 207, character_class: 'Wizard', character_race: 'Dwarf', is_alive: 'true')

            adventurer_2 = marcelline.player_characters.create!(player_name: 'Beemo', character_name: 'Rainbow', character_level: 8,character_age: 39, character_class: 'Artificer', character_race: 'Halfling', is_alive: 'true')

            visit '/player_characters'
            # save_and_open_page
            expect(page).to have_content(adventurer.player_name)
            expect(page).to have_content(adventurer_2.player_name)
            expect(page).to have_content(adventurer.id)
            expect(page).to have_content(adventurer.character_name)
            expect(page).to have_content(adventurer.character_level)
            expect(page).to have_content(adventurer.character_age)
            expect(page).to have_content(adventurer.character_class)
            expect(page).to have_content(adventurer.character_race)
            expect(page).to have_content(adventurer.is_alive)
            expect(page).to have_content(adventurer.created_at)
            expect(page).to have_content(adventurer.updated_at)
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