class Location < ActiveRecord::Base
  has_many :days

  def self.active_locations
    self.where(active: true)
  end

  def data
    return {id: self.loc_id, lat: self.lat, lon: self.lon, last_update: self.updated_at}
  end
end
