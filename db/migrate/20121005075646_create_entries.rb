class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.datetime :date
      t.string :title
      t.string :author
      t.text :content
      t.string :verse_reference
      t.string :verse_translation
      t.text :verse_content

      t.timestamps
    end
  end
end
