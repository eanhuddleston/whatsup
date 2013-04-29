module HomeHelper
  def find_nearby_events(loc, dist)
    Event.near([loc[0], loc[1]], dist)
  end

  def create_request(user_loc, nearby_events, simple_api_key)
    events_coords = nearby_events.map {|event| "#{event.latitude},#{event.longitude}" }
    markers_string = events_coords.join("|")
    user_marker_string = "color:blue|#{user_loc[0]},#{user_loc[1]}|"
    # markers_string = markers_string.prepend("#{user_loc[0]},#{user_loc[1]}|")


    search_string = "http://maps.googleapis.com/maps/api/staticmap?size=450x300" +
        "&sensor=false&zoom=12&center=#{user_loc[0]},#{user_loc[1]}" +
        "&key=#{simple_api_key}" +
        "&markers=#{user_marker_string}" +
        "&markers=color:red|#{markers_string}"

    Addressable::URI.escape(search_string)   

    # origin_query = Addressable::URI.new(
    #  :scheme => "http",
    #  :host => "maps.googleapis.com",
    #  :path => "/maps/api/staticmap",
    #  :query_values => {:size => "450x300", :zoom => 12, :sensor => false,
    #     :center => "#{user_loc[0]},#{user_loc[1]}",
    #     :markers => markers_string }
    # ).to_s

  end
end
