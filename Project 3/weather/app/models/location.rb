class Location < ActiveRecord::Base
  has_many :days

  def self.active_locations
    self.where(active: true)
  end

  def data
    return {id: self.loc_id, lat: self.lat, lon: self.lon, last_update: self.updated_at}
  end

  def predict(minutes)
    t = Time.now
    x = Array.new
    temp = Array.new
    rainfall = Array.new
    windspeed = Array.new
    day = Location.days.order("created_at DESC").limit(1).first
    build_arrays(day, t, x, temp, rainfall, windspeed)
    if(t.hour < 6)
      day = Location.days.order("created_at DESC").offset(1).limit(1).first
      build_arrays(day, t, x, temp, rainfall, windspeed, dir)
    end
    
    p_temp = predict_array(x, temp, minutes)
    p_rain = predict_array(x, rainfall, minutes)
    p_wind = predict_array(x, windspeed, minutes)

    output = Hash.new
    0.step(period, 10).each_with_index do |x, i|
      cur = {time: t + x.minutes}
      cur[:rain] = {value: p_rain[i], probability: 0.5}
      cur[:temp] = {value: p_temp[i], probability: 0.5}
      cur[:wind_speed] = {value: p_wind[i], probability: 0.5}
      cur[:wind_direction] = {value: dir, probablility: 0.5}
      output[x] = cur
    end
    return output
  end

  def build_arrays(day, t, x, temp, rainfall, windspeed, dir)
    backtime = -360
    best = backtime
    day.readings.each |reading| do
      cur = (reading.timestamp - t) / 1.minute
      if( cur > backtime )
        x << cur
        temp << reading.temp
        rainfall << reading.rainfall
        windspeed << reading.windspeed
	if(best < cur)
          best = cur
          dir = reading.winddirection
        end
      end
    end
  end

  def predict_array(x, y, period)
    p = Predict.new(x, y)
    p.regres
    return p.gety(period)
  end
end
