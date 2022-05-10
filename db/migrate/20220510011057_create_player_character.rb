class CreatePlayerCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :player_characters do |t|
      t.string :player_name
      t.string :character_name
      t.integer :age
      t.integer :character_level
      t.boolean :is_alive

      t.timestamps
    end
  end
end
