require 'rails_helper'

RSpec.describe 'adventurer show', type: :feature do
    it 'can present a specific adventurer with its attributes' do
        # As a visitor
        # When I visit '/child_table_name/:id'
        # Then I see the child with that id including the child's attributes:
        adventurer = PlayerCharacter.create!(player_name: 'karl', character_name: 'Falafel', character_level: 7,character_age: 207, character_class: 'Bard', character_race: 'Dwarf', is_alive: true)

        adventurer_2 = PlayerCharacter.create!(player_name: 'Beebo', character_name: 'Onion', character_level: 8,character_age: 39, character_class: 'Artificer', character_race: 'Halfling', is_alive: true)

        visit "/player_characters/#{adventurer.id}"
        # save_and_open_page
        expect(page).to have_content(adventurer.player_name)
        expect(page).to_not have_content(adventurer_2.player_name)
        expect(page).to have_content(adventurer.id)
        expect(page).to have_content(adventurer.character_name)
        expect(page).to have_content(adventurer.character_level)
        expect(page).to have_content(adventurer.character_age)
        expect(page).to have_content(adventurer.character_class)
        expect(page).to have_content(adventurer.character_race)
        expect(page).to have_content(adventurer.is_alive)
        expect(page).to have_content(adventurer.created_at)
        expect(page).to have_content(adventurer.updated_at)
    end
end