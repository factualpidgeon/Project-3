class Predict
		
	def initialize(x, y)
		@x = x
		@y = y
	end
	
	def regress()
	@a = 1
	@b = 1
	
	end
	
	def gety(period)
		predictions = []
		0.step(period, 10) { |x| predictions<<(@a*x + @b) }
		
		return predictions
	end

	
end
