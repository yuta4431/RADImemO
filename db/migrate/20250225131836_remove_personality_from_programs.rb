class RemovePersonalityFromPrograms < ActiveRecord::Migration[7.0]
  def change
    remove_column :programs, :personality, :string
  end
end
