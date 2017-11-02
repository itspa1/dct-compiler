class AddCodeColumnToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :code, :string
  end
end
