class RemoveDateFromEntry < ActiveRecord::Migration
  def up
    remove_column :entries, :date
  end

  def down
    add_column :entries, :date, :datetime
  end
end