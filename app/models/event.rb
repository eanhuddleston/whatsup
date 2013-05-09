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
  attr_accessible :address, :datetime, :description, :latitude, 
      :longitude, :title, :category_ids
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  validates :address, :datetime, :description, :title, :presence => true

  has_many :event_categories
  has_many :categories, :through => :event_categories

  has_many :comments

  has_many :reservations

  def self.trim(events_within_range, search_days, selected_categories)
    relevant_events = []
    events_within_range.each do |event|
      if selected_categories.include?(event.categories[0])
        if ( (event.datetime > DateTime.now) && 
            (event.datetime < DateTime.now + search_days.days) )
          relevant_events << event
        end
      end
    end

    relevant_events
  end
end
