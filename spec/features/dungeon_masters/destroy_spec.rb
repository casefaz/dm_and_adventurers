require 'rails_helper'

RSpec.describe 'DM deletion', type: :feature do
    describe 'user story 19' do
        # As a visitor
        # When I visit a parent show page
        # Then I see a link to delete the parent
        # When I click the link "Delete Parent"
        # Then a 'DELETE' request is sent to '/parents/:id',
        # the parent is deleted, and all child records are deleted
        # and I am redirected to the parent index page where I no longer see this parent
        it 'can delete a DM and its players' do 
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(player_name: 'Ed', character_name: 'Bonnet', character_level: 4,character_age: 32, character_class: 'Warlock', character_race: 'Tiefling', is_alive: 'true')
            adventurer2 = lucius.player_characters.create!(player_name: 'Stede', character_name: 'Teach', character_level: 5,character_age: 207, character_class: 'Swashbuckler', character_race: 'Genasi', is_alive: 'true')
            adventurer3 = lucius.player_characters.create!(player_name: 'Izzy', character_name: 'Hands', character_level: 3,character_age: 25, character_class: 'Bard', character_race: 'Half-Elf', is_alive: 'false')
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(player_name: 'Peppermint Butler', character_name: 'Valor the Just', character_level: 7,character_age: 207, character_class: 'Wizard', character_race: 'Dwarf', is_alive: true)

            visit '/player_characters'
            expect(page).to have_content(adventurer1.player_name)
            expect(page).to have_content(adventurer2.player_name)
            expect(page).to have_content(adventurer.player_name)

            visit '/dungeon_masters'
            expect(page).to have_content(lucius.name)
            expect(page).to have_content(marcelline.name)

            visit "/dungeon_masters/#{lucius.id}"
            expect(page).to have_content(lucius.name)
            expect(page).to_not have_content(marcelline.name)

            click_link "Delete #{lucius.name}"

            expect(current_path).to eq('/dungeon_masters')
            expect(page).to_not have_content(lucius.name)
            expect(page).to have_content(marcelline.name)

            visit '/player_characters'
            expect(page).to_not have_content(adventurer1.player_name)
            expect(page).to_not have_content(adventurer2.player_name)
            expect(page).to_not have_content(adventurer3.player_name)
            expect(page).to have_content(adventurer.player_name)

        end
    end
end