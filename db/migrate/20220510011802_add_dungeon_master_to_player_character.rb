# automatically creates a parent child relationship and establishes foreign key in player character table
class AddDungeonMasterToPlayerCharacter < ActiveRecord::Migration[5.2]
  def change
    add_reference :player_characters, :dungeon_master, foreign_key: true
  end
end
