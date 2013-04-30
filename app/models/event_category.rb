# == Schema Information
#
# Table name: event_categories
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EventCategory < ActiveRecord::Base
  attr_accessible :category_id, :event_id
  belongs_to :event
  belongs_to :category
end
