class CreateProgramPersonalities < ActiveRecord::Migration[7.0]
  def change
    create_table :program_personalities do |t|
      t.references :program, foreign_key: true, null: false
      t.references :personality, foreign_key: true, null: false

      t.timestamps
    end
    add_index :program_personalities, [:program_id, :personality_id], unique: true
  end
end
