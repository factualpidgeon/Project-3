class Reading < ActiveRecord::Base
  belongs_to :day

  def data
    h = {time: self.timestamp.strftime("%H:%M:%S %p"), temp: self.temp, precip: self.rainfall, wind_direction: winddirection, wind_speed: windspeed}
    return h
  end

  def cond
    prev = self.day.order("created_at DESC").offset(3).first
    if(prev.rainfall < self.rainfall)
      if(self.temp < 0)
        return "hailing"
      end
      return "raining"
    end
    if(self.temp < 20)
      return "cloudy"
    end
    return "sunny"
  end
end
