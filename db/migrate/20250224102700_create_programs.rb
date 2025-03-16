class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :title, null: false
      t.string :personality
      t.string :channel
      t.string :day, null: false
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
    add_index :programs, [:title, :channel], unique: true
  end
end
