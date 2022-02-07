class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :action
      t.jsonb :payload
      t.integer :issue_id
      t.timestamps
    end
    add_index :events, :issue_id
  end
end
