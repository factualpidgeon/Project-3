class DayController < ApplicationController
  respond_to :json, :html

  def show
    respond_to do |format|
      format.html {} #TODO
      format.json { self.json_show }
    end
  end

  def json_show
    t = params[:date]
    day_output = {date: t}
    if(params.key?(:location_id))
      location = Location.find_by loc_id: params[:location_id]
      date = location.days.order("created_at").last
      last = date.readings.order("created_at").last
      if((Time.now - last.created_at) / 1.minute > 30)
        day_output[:current_temp] = nil
        day_output[:current_cond] = nil
      else
        day_output[:current_temp] = last.temp
	#TODO add prediction for weather at T=0
	day_output[:current_cond] = "sunny"
      end
      day_output[:measurements] = date.get_all
    else
      a = Location.where(postcode: params[:post_code]).to_a
      location_readings = Array.new
      a.each do |loc|
        station = loc.data
        station[:measurements] = a.days.find_by(datestamp: t.to_date).get_all
	location_readings << station
      end
      day_output[:locations] = location_readings
    end
    respond_with( day_output.to_json )
  end
end
