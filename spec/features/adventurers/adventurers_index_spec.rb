require 'rails_helper'

RSpec.describe 'adventurer index', type: :feature do
    it 'can present each adventurer with its attributes' do
        # As a visitor
        # When I visit '/child_table_name'
        # Then I see each Child in the system including the Child's attributes:
        dm = DungeonMaster.create!(name: 'Ezra', number_of_players: 4, dm_active: true, level_range: 'mid')
        adventurer = Adventurer.create!(player_name: 'Karl', character_name: 'Garbanzo', age: 47, level: 7, is_alive: yes)
        adventurer_2 = Adventurer.create!(player_name: 'Beebo', character_name: 'Onion', age: 12, level: 8, is_alive: yes)

        visit '/adventurers'

        expect(page).to have_content(adventurer.player_name)
        expect(page).to have_content(adventurer2.player_name)
        expect(page).to have_content(adventurer.character_name)
        expect(page).to have_content(adventurer.age)
        expect(page).to have_content(adventurer.level)
        expect(page).to have_content(adventurer.is_alive)
    end
end