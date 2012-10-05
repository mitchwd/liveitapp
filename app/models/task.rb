class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  attr_accessible :user_id, :entry_id
end
