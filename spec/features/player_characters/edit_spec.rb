require 'rails_helper'

RSpec.describe 'edit player character' do
    describe 'user story 14' do 
        # As a visitor
        # When I visit a Child Show page
        # Then I see a link to update that Child "Update Child"
        # When I click the link
        # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
        # When I click the button to submit the form "Update Child"
        # Then a `PATCH` request is sent to '/child_table_name/:id',
        # the child's data is updated,
        # and I am redirected to the Child Show page where I see the Child's updated information
        it 'links to the adventurer edit page' do
            dm = DungeonMaster.create!(name: 'Fang', number_of_players: 2, dm_active: true, level_range: 'mid')
            adventurer1 = dm.player_characters.create!(player_name: 'Ivan', character_name: 'Knives', character_level: 2,character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: 'true') 

            visit "/player_characters/#{adventurer1.id}"

            click_link "Update #{adventurer1.player_name}"

            expect(current_path).to eq("/player_characters/#{adventurer1.id}/edit")
        end
        
        it 'can update the adventurer' do 
            dm = DungeonMaster.create!(name: 'Fang', number_of_players: 2, dm_active: true, level_range: 'mid')
            adventurer1 = dm.player_characters.create!(player_name: 'Ivan', character_name: 'Nifes', character_level: 2, character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: true)

            visit "/player_characters/#{adventurer1.id}"

            expect(page).to have_content('Nifes')

            click_link('Update Ivan')
            # save_and_open_page
            fill_in(:player_name, with: 'Ivan')
            fill_in(:character_name, with: 'Knives')
            fill_in(:character_age, with: 50)
            fill_in(:character_level, with: 2)
            fill_in(:character_class, with: 'Barbarian')
            fill_in(:character_race, with: 'Dwarf')
            fill_in(:is_alive, with: false)
            click_button('Update Adventurer')
            # save_and_open_page
            expect(current_path).to eq("/player_characters/#{adventurer1.id}")
            expect(page).to have_content('Ivan')
            expect(page).to have_content('Knives')
            expect(page).to have_content('false')
            expect(page).to_not have_content('Nifes')

        end
    end
end