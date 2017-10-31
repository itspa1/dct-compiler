class AddSourceToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :source, :string
  end
end
