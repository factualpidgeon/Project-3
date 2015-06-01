class LocationController < ApplicationController
  def index
    @locations = Location.active_locations
  end

  def predict
  end

  def json_index
    loc_data = Array.new
    Location.active_locations.each {|loc| loc_data << loc.data}
    locs_output = {date: Time.now.strftime("%d-%m-%Y"), locations: loc_data}
    render locs_output.to_json
  end

  def json_predict
    if(params.has_key?(:post_code))
      prediction_output = {postcode: params[:post_code]}
      #TODO need to match lat/lon with postcode
      latlon = [50, 50]
    else
      prediction_output = {lattitude: params[:lat], longitude: params[:lon]}
      latlon = [params[:lat], params[:lon]]
    end

    Location.active_locations.each do |location|
      test = (location.lat - latlon[0])**2 + (location.lon - latlon[1])**2
      if(best_dist.nil? || (test < best_dist))
        best_dist = test
        best_loc = location
      end
    end
    
    predictions = Hash.new
    #TODO get predictions from predict class
    
    render prediction_output.to_json
  end
end
