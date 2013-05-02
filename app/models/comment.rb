class Comment < ActiveRecord::Base
  attr_accessible :text, :event_id, :user_id

  belongs_to :event
  belongs_to :user

end