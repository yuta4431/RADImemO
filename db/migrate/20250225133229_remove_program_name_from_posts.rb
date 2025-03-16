class RemoveProgramNameFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :program_name, :string
  end
end
