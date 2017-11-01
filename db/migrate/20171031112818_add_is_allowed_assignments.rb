class AddIsAllowedAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :is_allowed, :boolean, default: :false
  end
end
