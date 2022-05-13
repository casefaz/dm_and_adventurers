require 'rails_helper'

RSpec.describe DungeonMaster, type: :model do
    describe 'relationships' do
        it { should have_many :player_characters }
    end

    describe 'valdiations' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :number_of_players }
        it { should validate_presence_of :level_range }
        it { should allow_value(true).for (:dm_active) }
        it { should allow_value(false).for (:dm_active) }
    end

    describe 'class methods' do
        it 'can order by the most recently entered dungeon master' do
            lucius = DungeonMaster.create!(name: 'Lucius', number_of_players: 3, dm_active: 'true', level_range: 'high')
            frenchie = DungeonMaster.create!(name: 'Frenchie', number_of_players: 2, dm_active: 'true', level_range: 'mid')

            expect(DungeonMaster.most_recent).to eq([frenchie,lucius])
        end
    end 
end