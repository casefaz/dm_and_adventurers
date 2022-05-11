require 'rails_helper'

RSpec.describe 'adventurer index', type: :feature do
    it 'can present each adventurer with its attributes' do
        # As a visitor
        # When I visit '/child_table_name'
        # Then I see each Child in the system including the Child's attributes:
        adventurer = PlayerCharacter.create!(player_name: 'Karl', character_name: 'Garbanzo', age: 47, character_level: 7, is_alive: false)
        adventurer_2 = PlayerCharacter.create!(player_name: 'Beebo', character_name: 'Onion', age: 12, character_level: 8, is_alive: true)

        visit '/player_characters'
        # save_and_open_page
        expect(page).to have_content(adventurer.player_name)
        expect(page).to have_content(adventurer_2.player_name)
        expect(page).to have_content(adventurer.id)
        expect(page).to have_content(adventurer.character_name)
        expect(page).to have_content(adventurer.age)
        expect(page).to have_content(adventurer.character_level)
        expect(page).to have_content(adventurer.is_alive)
        expect(page).to have_content(adventurer.created_at)
        expect(page).to have_content(adventurer.updated_at)
    end
end