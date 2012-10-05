class Entry < ActiveRecord::Base
  attr_accessible :author, :content, :date, :title, :verse_content, :verse_reference, :verse_translation
  
  validates_presence_of :title, :content, :date, :verse_content, :verse_reference, :verse_translation
  
  validates_uniqueness_of :date, message: "already taken. Please choose a separate date."
  validates_uniqueness_of :title
  
  validates_length_of :translation, :within => 1..5
  
end
