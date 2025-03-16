class CreatePersonality < ActiveRecord::Migration[7.0]
  def change
    create_table :personalities do |t|
      t.string :name

      t.timestamps
    end
    add_index :personalities, :name, unique: true
  end
end
