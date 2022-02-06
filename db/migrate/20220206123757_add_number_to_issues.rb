class AddNumberToIssues < ActiveRecord::Migration[6.1]
  def change
    add_column :issues, :number, :string
    add_index :issues, :number, unique: true
  end
end
