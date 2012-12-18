class Entry < ActiveRecord::Base
  attr_accessible :author, :content, :title, :verse_content, :verse_reference, :verse_translation
  
  has_many :tasks, :dependent => :destroy
  has_many :users, :through => :tasks
  
  validates_presence_of :title, :content, :verse_content, :verse_reference, :verse_translation
    
  validates_length_of :verse_translation, :within => 1..5
  
  default_scope order: 'id ASC'
  
end
