class Day < ActiveRecord::Base
  belongs_to :location
  has_many :readings
end
