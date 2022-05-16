require 'rails_helper'

RSpec.describe 'DM Creation', type: :feature do
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
    
    describe 'user story 11' do
        # As a visitor
        # When I visit the Parent Index page
        # Then I see a link to create a new Parent record, "New Parent"
        # When I click this link
        # Then I am taken to '/parents/new' where I  see a form for a new parent record
        # When I fill out the form with a new parent's attributes:
        # And I click the button "Create Parent" to submit the form
        # Then a `POST` request is sent to the '/parents' route,
        # a new parent record is created,
        # and I am redirected to the Parent Index page where I see the new Parent displayed.
        it 'links to the new page from dm index' do
            visit '/dungeon_masters'

            click_link 'New Dungeon Master'
            expect(current_path).to eq('/dungeon_masters/new')
            expect(page).to have_content("New Dungeon Master Form")
        end

        it 'can create a new artist' do
            visit '/dungeon_masters/new'

            fill_in('Name', with: 'Fang')
            fill_in(:number_of_players, with: 2)
            fill_in(:dm_active, with: true)
            fill_in(:level_range, with: 'mid')
            
            click_button('Create Dungeon Master')

            # save_and_open_page
            expect(current_path).to eq('/dungeon_masters')
            expect(page).to have_content('Fang')
        end
    end
end