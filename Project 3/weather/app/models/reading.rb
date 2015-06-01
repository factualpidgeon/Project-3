class Reading < ActiveRecord::Base
  belongs_to :day

  def data
    h = {time: self.timestamp.strftime("%H:%M:%S %p"), temp: self.temp, precip: self.rainfall, wind_direction: winddirection, wind_speed: windspeed}
    return h
  end
end
