require 'rails_helper'

RSpec.describe 'new dungeon master player character', type: :feature do
    describe 'user story 8' do
        it 'has a link that goes to player_character index' do
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(player_name: 'Peppermint Butler', character_name: 'Valor the Just', character_level: 7,character_age: 207, character_class: 'Wizard', character_race: 'Dwarf', is_alive: true)

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
            adventurer = marcelline.player_characters.create!(player_name: 'Peppermint Butler', character_name: 'Valor the Just', character_level: 7,character_age: 207, character_class: 'Wizard', character_race: 'Dwarf', is_alive: true)

            visit '/dungeon_masters'
            expect(page).to have_content(marcelline.name)

            click_link 'Dungeon Masters'
            # save_and_open_page
            expect(current_path).to eq('/dungeon_masters')
        end
    end
    
    describe 'user story 13' do
        # As a visitor
        # When I visit a Parent Childs Index page
        # Then I see a link to add a new adoptable child for that parent "Create Child"
        # When I click the link
        # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
        # When I fill in the form with the child's attributes:
        # And I click the button "Create Child"
        # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
        # a new child object/row is created for that parent,
        # and I am redirected to the Parent Childs Index page where I can see the new child listed
        it 'can link to a new create adventurer option' do
            dm = DungeonMaster.create!(name: 'Fang', number_of_players: 2, dm_active: true, level_range: 'mid')
            adventurer1 = dm.player_characters.create!(player_name: 'Ivan', character_name: 'Gun Powder', character_level: 2,character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: 'true') 

            visit "dungeon_masters/#{dm.id}/player_characters"

            expect(page).to have_content('Ivan')

            click_link('Create Adventurer')
            # save_and_open_page
            expect(current_path).to eq("/dungeon_masters/#{dm.id}/player_characters/new")
            expect(page).to have_content("New Adventurer Form")
        end

        it 'can create a new adventurer' do 
            dm = DungeonMaster.create!(name: 'Fang', number_of_players: 2, dm_active: true, level_range: 'mid')
            adventurer1 = dm.player_characters.create!(player_name: 'Ivan', character_name: 'Gun Powder', character_level: 2,character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: 'true') 

            visit "/dungeon_masters/#{dm.id}/player_characters/new"
            # save_and_open_page
            fill_in(:player_name, with: "Buttons")
            fill_in(:character_name, with: "karl")
            fill_in(:character_age, with: 7)
            fill_in(:character_level, with: 1)
            fill_in(:character_class, with: "Rogue")
            fill_in(:character_race, with: "Changeling")
            select('true', from: :is_alive)
            click_button('Create Adventurer')
            # save_and_open_page
            expect(current_path).to eq("/dungeon_masters/#{dm.id}/player_characters")
            expect(page).to have_content('Buttons')
            expect(page).to have_content('karl')
            expect(page).to have_content('Changeling')
            expect(page).to have_content('true')

        end
    end
end