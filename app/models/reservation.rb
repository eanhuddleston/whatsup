class Reservation < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  belongs_to :event
  belongs_to :user

  validates :event_id, :user_id, :presence => true
  validates_uniqueness_of :event_id, :scope => :user_id
end
