class AddPersonalityNameToPrograms < ActiveRecord::Migration[7.0]
  def change
    add_column :programs, :personality_name, :string
  end
end
