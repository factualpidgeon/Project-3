class LocationController < ApplicationController
  def index
    @locations = Location.active_locations
  end

  def id_date
  end

  def pcode_date
  end

  def pcode_predict
  end

  def lat_lon_predict
  end
end
