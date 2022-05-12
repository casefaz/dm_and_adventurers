class AddDetailsToPlayerCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :player_characters, :character_class, :string
    add_column :player_characters, :character_race, :string
  end
end
