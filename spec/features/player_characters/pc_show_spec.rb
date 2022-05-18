require 'rails_helper'

RSpec.describe 'adventurer show', type: :feature do
    describe 'user story 4' do
        it 'can present a specific adventurer with its attributes' do
            # As a visitor
            # When I visit '/child_table_name/:id'
            # Then I see the child with that id including the child's attributes:
            amethyst = DungeonMaster.create!(name: 'Amethyst', number_of_players: 5, dm_active: false, level_range: 'low')

            adventurer = amethyst.player_characters.create!(
                player_name: 'Pearl', 
                character_name: 'Pink Diamond', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Ranger', 
                character_race: 'Aasimar', 
                is_alive: true)
            adventurer_2 = amethyst.player_characters.create!(
                player_name: 'Garnet', 
                character_name: 'Steven', 
                character_level: 8,
                character_age: 39, 
                character_class: 'Paladin', 
                character_race: 'Halfling', 
                is_alive: true)

            visit "/player_characters/#{adventurer.id}"
            # save_and_open_page
            expect(page).to have_content(adventurer.player_name)
            expect(page).to_not have_content(adventurer_2.player_name)
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
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(
                player_name: 'Peppermint Butler', 
                character_name: 'Valor the Just', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Wizard', 
                character_race: 'Dwarf', 
                is_alive: true)

            visit '/player_characters'
            expect(page).to have_content(adventurer.player_name)

            click_link 'Adventurers'
            # save_and_open_page
            expect(current_path).to eq('/player_characters')
            expect(page).to have_content('Peppermint Butler')
        end
    end

    describe 'user story 9' do
        it 'has a link on every page that goes to dungeon_master_index' do
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(
                player_name: 'Peppermint Butler', 
                character_name: 'Valor the Just', 
                character_level: 7,
                character_age: 207, 
                character_class: 'Wizard', 
                character_race: 'Dwarf', 
                is_alive: true)

            visit '/dungeon_masters'
            expect(page).to have_content(marcelline.name)

            click_link 'Dungeon Masters'
            # save_and_open_page
            expect(current_path).to eq('/dungeon_masters')
            expect(page).to have_content('Marcelline')
        end
    end
end