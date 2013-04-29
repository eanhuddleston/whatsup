# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  datetime    :datetime
#  address     :string(255)
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :address, :datetime, :description, :latitude, :longitude, :title
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
