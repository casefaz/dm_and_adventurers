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
            adventurer1 = dm.player_characters.create!(player_name: 'Ivan', character_name: 'Gun Powder', character_level: 2,character_age: 50, character_class: 'Barbarian', character_race: 'Dwarf', is_alive: 'true') 

            visit "/player_characters/#{adventurer1.id}"

            click_link "Update #{adventurer1.player_name}"

            expect(current_path).to eq("/player_characters/#{adventurer1.id}/edit")
        end
    end
end