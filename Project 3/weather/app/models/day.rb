class Day < ActiveRecord::Base
  belongs_to :location
  has_many :readings

  def get_all
    a = Array.new
    self.readings.each do |r|
      h = r.data
      a << h
    end
    return a
  end
end
