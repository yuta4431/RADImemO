class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :program, null: false, foreign_key: true
      t.datetime :broadcast_date
      t.text :content
      t.string :program_name

      t.timestamps
    end
  end
end
