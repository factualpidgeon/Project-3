class LocationController < ApplicationController
  def index
    @locations = Location.active_locations
  end

  def predict
  end

  def json_index
    loc_data = Array.new
    Location.active_locations.each {|loc| loc_data << loc.data}
    locs_output = {date: "", locations: loc_data}
    render locs_output.to_json
  end

  def json_predict
    p
    prediction_output = 
    render prediction_output.to_json
  end
end
