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

require 'test_helper'

class EventCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
