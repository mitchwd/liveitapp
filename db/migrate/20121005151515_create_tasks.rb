class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :entry

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :entry_id
  end
end
