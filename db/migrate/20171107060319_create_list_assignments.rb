class CreateListAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :list_assignments do |t|
      t.integer :list_id
      t.integer :assignment_id

      t.timestamps
    end
  end
end
