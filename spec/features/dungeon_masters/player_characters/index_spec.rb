require 'rails_helper'

RSpec.describe 'dungeon master and player_character index', type: :feature do
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    describe 'user story 5' do 
        it 'can show each child with their attributes associated with the parent' do
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
            adventurer3 = lucius.player_characters.create!(
                player_name: 'Izzy', 
                character_name: 'Hands', 
                character_level: 3,
                character_age: 25, 
                character_class: 'Bard', 
                character_race: 'Half-Elf', 
                is_alive: false)
        
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')
            adventurer4 = frenchie.player_characters.create!(
                player_name: 'Wee John',
                character_name: 'Gun Powder', 
                character_level: 2,
                character_age: 50, 
                character_class: 'Barbarian', 
                character_race: 'Dwarf', 
                is_alive: true)
            adventurer5 = frenchie.player_characters.create!(
                player_name: 'Oluwande', 
                character_name: 'Jim', 
                character_level: 3,
                character_age: 29, 
                character_class: 'Rogue', 
                character_race: 'Human', 
                is_alive: true)
        
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

    describe 'user story 16' do
        # As a visitor
        # When I visit the Parent's children Index Page
        # Then I see a link to sort children in alphabetical order
        # When I click on the link
        # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
        it 'has a link to sort adventurers alphabetically' do
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')
            adventurer1 = frenchie.player_characters.create!(
                player_name: 'Wee John', 
                character_name: 'Gun Powder', 
                character_level: 2,
                character_age: 50, 
                character_class: 'Barbarian', 
                character_race: 'Dwarf', 
                is_alive: true)
            adventurer2 = frenchie.player_characters.create!(
                player_name: 'Oluwande', 
                character_name: 'Jim', 
                character_level: 3,
                character_age: 29, 
                character_class: 'Rogue', 
                character_race: 'Human', 
                is_alive: 'true')
            
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer3 = lucius.player_characters.create!(
                player_name: 'Ed', 
                character_name: 'Bonnet', 
                character_level: 4,
                character_age: 32, 
                character_class: 'Warlock', 
                character_race: 'Tiefling', 
                is_alive: true)

            visit "/dungeon_masters/#{frenchie.id}/player_characters/"
            expect(adventurer1.player_name).to appear_before(adventurer2.player_name)

            click_link 'Sort Adventurers Alphabetically'

            expect(current_path).to eq("/dungeon_masters/#{frenchie.id}/player_characters/")
            expect(adventurer2.player_name).to appear_before(adventurer1.player_name)
            expect(page).to_not have_content(adventurer3.player_name)
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

            visit "/dungeon_masters/#{marcelline.id}/player_characters"
            expect(page).to have_content('Rainbow Butterfly')
            # save_and_open_page
            within("#playerCharacter-#{adventurer_2.id}") do
                click_link "Update #{adventurer_2.player_name}"
                expect(current_path).to eq("/player_characters/#{adventurer_2.id}/edit")
            end
        end
    end 

    describe 'user story 21' do 
        # As a visitor
        # When I visit the Parent's children Index Page
        # I see a form that allows me to input a number value
        # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
        # Then I am brought back to the current index page with only the records that meet that threshold shown.
        it 'can show characters above a certain level' do 
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(
                player_name: 'Ed', 
                character_name: 'Bonnet', 
                character_level: 6,
                character_age: 32, 
                character_class: 'Warlock', 
                character_race: 'Tiefling', 
                is_alive: true)
            adventurer2 = lucius.player_characters.create!(
                player_name: 'Stede', 
                character_name: 'Teach', 
                character_level: 7,
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

            visit "/dungeon_masters/#{lucius.id}/player_characters"
            expect(page).to have_content('Izzy')
            # save_and_open_page
            fill_in(:threshold, with: 5)
            click_button("Submit Search")
            expect(page).to have_content("Ed")
            expect(page).to have_content("Stede")
            expect(page).to_not have_content("Izzy")
        end
    end
end