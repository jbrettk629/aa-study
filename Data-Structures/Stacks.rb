
class Node 
	attr_accessor :value
	def initilize(val)
		@value = val
	end 
end

class Stack 
	# LIFO = last in, first out

	def initialize 
		@stack = []
		@mins = []
	end 

	def add(value)
		el = Node.new(value)
		@stack.push(el)
	end 

	def remove
		@stack.pop
	end 

	def is_empty?
		@stack[0] ? true : false 
	end 

	def update_min(el)
		@mins << el if @mins.empty?
	end

	def min
	end 

end