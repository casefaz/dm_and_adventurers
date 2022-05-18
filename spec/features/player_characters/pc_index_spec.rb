require 'rails_helper'

RSpec.describe 'adventurer index', type: :feature do
    describe 'user story 3' do 
        it 'can present each adventurer with its attributes' do
            # As a visitor
            # When I visit '/child_table_name'
            # Then I see each Child in the system including the Child's attributes:
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
        end
    end

    describe 'user story 15' do 
        # As a visitor
        # When I visit the child index
        # Then I only see records where the boolean column is `true`
        it 'only shows adventurers who are alive' do 
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

            visit '/player_characters'

            expect(page).to have_content('Beemo')
            expect(page).to have_content('Peppermint Butler')
            expect(page).to_not have_content('Lemongrab')
        end
    end

    describe 'user story 18' do 
        # As a visitor
        # When I visit the `child_table_name` index page or a parent `child_table_name` index page
        # Next to every child, I see a link to edit that child's info
        # When I click the link
        # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
        it 'links to edit next to every adventurer' do
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

            visit '/player_characters'
            expect(page).to have_content(adventurer.player_name)
            expect(page).to have_content("Update #{adventurer.player_name}")

            # save_and_open_page
            within("#playerCharacter-#{adventurer.id}") do
                click_link "Update #{adventurer.player_name}"
                expect(current_path).to eq("/player_characters/#{adventurer.id}/edit")
            end

            visit '/player_characters'

            within("#playerCharacter-#{adventurer_2.id}") do
                click_link "Update #{adventurer_2.player_name}"
                expect(current_path).to eq("/player_characters/#{adventurer_2.id}/edit")
            end
        end
    end
end