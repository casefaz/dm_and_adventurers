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
end