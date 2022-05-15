require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
    describe 'relationships' do
        it {should belong_to :dungeon_master}
    end

    describe 'validations' do
        it { should validate_presence_of :player_name }
        it { should validate_presence_of :character_name }
        it { should validate_presence_of :character_age }
        it { should validate_presence_of :character_level }
        it { should validate_presence_of :character_class }
        it { should validate_presence_of :character_race }
        it { should allow_value(true).for(:is_alive) }
        it { should allow_value(false).for(:is_alive) }
    end

    describe 'class methods' do 
        # As a visitor
        # When I visit the child index
        # Then I only see records where the boolean column is `true`
        it 'can show only not dead adventurers' do
            marcelline = DungeonMaster.create!(name: 'Marcelline', number_of_players: 4, dm_active: true, level_range: 'mid')
            adventurer = marcelline.player_characters.create!(player_name: 'Peppermint Butler', character_name: 'Valor the Just', character_level: 7,character_age: 207, character_class: 'Wizard', character_race: 'Dwarf', is_alive: true)

            adventurer_2 = marcelline.player_characters.create!(player_name: 'Beemo', character_name: 'Rainbow Butterfly', character_level: 8,character_age: 39, character_class: 'Artificer', character_race: 'Halfling', is_alive: true)

            adventurer_3 = marcelline.player_characters.create!(player_name: 'Lemongrab', character_name: 'Unacceptable', character_level: 8,character_age: 39, character_class: 'Cleric', character_race: 'Human', is_alive: false)

            expect(PlayerCharacter.dead_or_alive).to eq([adventurer, adventurer_2])
        end
    end
end