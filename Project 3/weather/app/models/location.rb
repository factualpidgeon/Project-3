class Location < ActiveRecord::Base
  has_many :days

  def self.active_locations
    self.where(active: true)
  end
end
