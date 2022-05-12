require 'rails_helper'

RSpec.describe DungeonMaster, type: :model do
    it {should have_many :player_characters}
end