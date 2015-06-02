class LocationController < ApplicationController
  respond_to :json, :html
  
  def index
    respond_to do |format|
      format.html { @locations = Location.active_locations }
      format.json { self.json_index }
    end
    
  end

  def predict
    respond_to do |format|
      format.html do
        if(params.has_key?(:post_code))
          latlon = Getlatlon.get(params[:post_code])
        else
          latlon = [params[:lat].to_f, params[:lon].to_f]
        end
        @location = get_nearest(latlon)
      end
      format.json { self.json_predict }
    end
  end

  def json_index
    loc_data = Array.new
    Location.active_locations.each {|loc| loc_data << loc.data}
    locs_output = {date: Time.now.strftime("%d-%m-%Y"), locations: loc_data}
    respond_with( locs_output.to_json )
  end

  def json_predict
    if(params.has_key?(:post_code))
      prediction_output = {postcode: params[:post_code]}
      latlon = Getlatlon.get(params[:post_code])
    else
      lat = params[:lat].to_f
      lon = params[:lon].to_f
      prediction_output = {lattitude: lat, longitude: lon}
      latlon = [lat, lon]
    end

    location = get_nearest(latlon)
    
    predictions = location.predict(params[:period].to_f)
    prediction_output[:predictions] = predictions
    respnd_with( prediction_output.to_json )
  end

  def get_nearest(latlon)
    best_dist = nil
    best_loc = nil
    Location.active_locations.each do |location|
      test = (location.lat - latlon[0])**2 + (location.lon - latlon[1])**2
      if(best_dist.nil? || (test < best_dist))
        best_dist = test
        best_loc = location
      end
    end
    return best_loc
  end
end
