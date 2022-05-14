require 'rails_helper'

RSpec.describe 'dm index page', type: :feature do
    describe 'user story 1' do
        # For each parent table
        # As a visitor
        # When I visit '/parents'
        # Then I see the name of each parent record in the system
        it 'can see the names of all the dms in the system' do
            dm = DungeonMaster.create!(name: 'Amethyst', number_of_players: 4, dm_active: true, level_range: 'mid')
            dm_2 = DungeonMaster.create!(name: 'Marcelline', number_of_players: 7, dm_active: true, level_range: 'high')
            dm_3 = DungeonMaster.create!(name: 'Lucius', number_of_players: 5, dm_active: false, level_range: 'low')
            dm_4 = DungeonMaster.create!(name: 'Frenchie', number_of_players: 9, dm_active: true, level_range: 'low')
            
            visit '/dungeon_masters'
            # save_and_open_page
            expect(page).to have_content(dm.name)
            expect(page).to have_content(dm_2.name)
            expect(page).to have_content(dm_3.name)
            expect(page).to have_content(dm_4.name)
        end
    end 

    describe 'user story 6' do 
        # As a visitor
        # When I visit the parent index,
        # I see that records are ordered by most recently created first
        # And next to each of the records I see when it was created
        it 'can order the records that appear on the parent index' do
            lucius = DungeonMaster.create!(name: 'Lucius',number_of_players: 3, dm_active: 'true', level_range: 'high')
        
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')

            visit "/dungeon_masters"
            # save_and_open_page
            expect('Frenchie').to appear_before('Lucius')
            expect(page).to have_content(lucius.created_at)
            expect(page).to have_content(frenchie.created_at)
        end
    end

    describe 'user story 8' do
        it 'has a link that goes to player_character_index' do
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
        it 'can create a new dm form' do
            visit '/dungeon_masters'

            click_link "New Dungeon Master"
            expect(current_path).to eq('/dungeon_masters/new')
        end
    end
end