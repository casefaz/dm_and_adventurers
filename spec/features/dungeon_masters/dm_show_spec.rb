require 'rails_helper'

RSpec.describe 'dm show page', type: :feature do
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
    it 'can show the attributes of a specific dm' do
        dm = DungeonMaster.create!(name: 'Ezra', number_of_players: 4, dm_active: true, level_range: 'mid')
        dm_2 = DungeonMaster.create!(name: 'Mai', number_of_players: 7, dm_active: true, level_range: 'high')
        dm_3 = DungeonMaster.create!(name: 'Kai', number_of_players: 5, dm_active: false, level_range: 'low')
        dm_4 = DungeonMaster.create!(name: 'Lorelai', number_of_players: 9, dm_active: true, level_range: 'low')
        
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