require 'rails_helper'

RSpec.describe 'destroy children', type: :feature do 
    describe 'user story 20' do 
        # As a visitor
        # When I visit a child show page
        # Then I see a link to delete the child "Delete Child"
        # When I click the link
        # Then a 'DELETE' request is sent to '/child_table_name/:id',
        # the child is deleted,
        # and I am redirected to the child index page where I no longer see this child
        it 'deletes child entries' do 
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            adventurer1 = lucius.player_characters.create!(player_name: 'Ed', character_name: 'Bonnet', character_level: 4,character_age: 32, character_class: 'Warlock', character_race: 'Tiefling', is_alive: true)
            adventurer2 = lucius.player_characters.create!(player_name: 'Stede', character_name: 'Teach', character_level: 5,character_age: 207, character_class: 'Swashbuckler', character_race: 'Genasi', is_alive: true)
            adventurer3 = lucius.player_characters.create!(player_name: 'Izzy', character_name: 'Hands', character_level: 3,character_age: 25, character_class: 'Bard', character_race: 'Half-Elf', is_alive: true)
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(player_name: 'Peppermint Butler', character_name: 'Valor the Just', character_level: 7,character_age: 207, character_class: 'Wizard', character_race: 'Dwarf', is_alive: true)

            visit '/player_characters'
            # save_and_open_page
            expect(page).to have_content(adventurer1.player_name)
            expect(page).to have_content(adventurer3.player_name)
            expect(page).to have_content(adventurer.player_name)


            visit "/player_characters/#{adventurer3.id}"
            expect(page).to have_content(adventurer3.player_name)
            expect(page).to_not have_content(adventurer.player_name)
            save_and_open_page
            click_link "Delete #{adventurer3.player_name}"
            expect(current_path).to eq("/player_characters")
            expect(page).to have_content(adventurer1.player_name)
            expect(page).to have_content(adventurer2.player_name)
            expect(page).to have_content(adventurer.player_name)
            expect(page).to_not have_content(adventurer3.player_name)
        end
    end
end