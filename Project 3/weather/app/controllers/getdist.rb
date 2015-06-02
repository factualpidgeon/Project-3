def  getdist(a,b)
	lat1 = a[0]
	lat2 = b[0]
	lon1 = a[1]
	lon2 = b[1]
	theta = lon1 - lon2
	dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta))
	dist = Math.acos(dist)
	dist = rad2deg(dist)
	dist = dist * 60 * 1.1515
	dist = dist * 1.609344
	return (dist)
end

def deg2rad(deg)
	return (deg * Math::PI / 180.0);
end

def rad2deg(rad)
	return (rad / Math::PI * 180.0);
end




