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
end