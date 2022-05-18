require 'rails_helper'

RSpec.describe 'DM edits', type: :feature do
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
    
    describe 'user story 12' do
        # As a visitor
        # When I visit a parent show page
        # Then I see a link to update the parent "Update Parent"
        # When I click the link "Update Parent"
        # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
        # When I fill out the form with updated information
        # And I click the button to submit the form
        # Then a `PATCH` request is sent to '/parents/:id',
        # the parent's info is updated,
        # and I am redirected to the Parent's Show page where I see the parent's updated info
        it 'links to the edit page' do
            dm = DungeonMaster.create!(name: 'Fang', number_of_players: 2, dm_active: true, level_range: 'mid')
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')

            visit "/dungeon_masters/#{dm.id}"
            expect(page).to have_content('Fang')
            expect(page).to_not have_content('Lucius')
            # save_and_open_page
            # binding.pry
            click_link "Edit #{dm.name}"
            # save_and_open_page
            expect(current_path).to eq("/dungeon_masters/#{dm.id}/edit")
            expect(page).to have_content('Edit Dungeon Master')
        end

        it 'can edit the dungeon master' do
            dm = DungeonMaster.create!(name: 'Fng', number_of_players: 2, dm_active: true, level_range: 'mid')

            visit "/dungeon_masters/#{dm.id}"
            expect(page).to have_content("Fng")

            click_link('Edit Fng')
            expect(current_path).to eq("/dungeon_masters/#{dm.id}/edit")

            fill_in('Name', with: 'Fang')
            fill_in(:number_of_players, with: 1)
            select('true', from: :dm_active)
            fill_in(:level_range, with: 'high')

            click_button('Update Dungeon Master')
            # save_and_open_page
            expect(current_path).to eq("/dungeon_masters/#{dm.id}")
            expect(page).to have_content('Fang')
            expect(page).to have_content('1')
            expect(page).to have_content('true')
            expect(page).to have_content('high')

            expect(page).to_not have_content('Fng')
            expect(page).to_not have_content('mid')

        end
    end
end