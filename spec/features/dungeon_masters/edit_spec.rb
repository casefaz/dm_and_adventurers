require 'rails_helper'

RSpec.describe 'DM edits' do
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

            visit "/dungeon_masters/#{dm.id}"
            # save_and_open_page
            # binding.pry
            click_link "Edit #{dm.name}"

            # save_and_open_page

            expect(current_path).to eq("/dungeon_masters/#{dm.id}/edit")
        end

        it 'can edit the dungeon master' do
            dm = DungeonMaster.create!(name: 'Fng', number_of_players: 2, dm_active: true, level_range: 'mid')

            visit "/dungeon_masters/#{dm.id}"
            save_and_open_page
            expect(page).to have_content("Fng")

            click_link 'Edit Fng'

            fill_in 'Name', with: 'Fang'
            click_button 'Update Dungeon Master'

            expect(current_path).to eq('/dungeon_masters')
            expect(page).to have_content('Fang')
        end
    end
end