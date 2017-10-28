class AddColumnToAnswersOutputString < ActiveRecord::Migration[5.0]
  def change
    add_column :answers ,:output, :string
  end
end
