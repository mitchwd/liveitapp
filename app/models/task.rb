class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  
  attr_accessible :user_id, :entry_id
  validates_presence_of :user_id, :entry_id
  validates_uniqueness_of :user_id, :scope => :entry_id, :message => "has already completed this entry."
  
end
