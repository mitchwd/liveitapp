class Entry < ActiveRecord::Base
  attr_accessible :author, :content, :date, :title, :verse_content, :verse_reference, :verse_translation
  
  has_many :tasks, :dependent => :destroy
  has_many :users, :through => :tasks
  
  validates_presence_of :title, :content, :date, :verse_content, :verse_reference, :verse_translation
  
  validates_uniqueness_of :date, message: "already taken. Please choose a separate date."
  
  validates_length_of :verse_translation, :within => 1..5
  
  
end
