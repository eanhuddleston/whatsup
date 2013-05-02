class Comment < ActiveRecord::Base
  attr_accessible :text, :event_id, :user_id

  validates :text, :event_id, :user_id, :presence => true

  belongs_to :event
  belongs_to :user

end