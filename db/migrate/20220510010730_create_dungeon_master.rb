class CreateDungeonMaster < ActiveRecord::Migration[5.2]
  def change
    create_table :dungeon_masters do |t|
      t.string :name
      t.integer :number_of_players
      t.boolean :dm_active
      t.string :level_range

      t.timestamps # this automatically creates created_at and updated_at columns
    end
  end
end
