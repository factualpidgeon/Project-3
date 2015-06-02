require 'matrix'
module Predict
class Pred
		
	def initialize(x, y)
		@xs = x
		@ys = y
	end

	def regres()
		degree = 1
		x_data = @xs.map { |x_i| (0..degree).map { |pow| (x_i**pow).to_f} }
		mx = Matrix[*x_data]
		my = Matrix.column_vector(@ys)
		@coefficients = ((mx.t * mx).inv * mx.t * my).transpose.to_a[0]
	end
	
	def gety(period)
		predictions = []
		0.step(period, 10).with_index do |x, i|  
			y = 0
			@coefficients.each_with_index do |a, n|
				y += a * (x ** n)
			end
			predictions<<y
		end
		return predictions
	end
	
end
end
