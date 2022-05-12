require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
    it {should belong_to :dungeon_master}
end