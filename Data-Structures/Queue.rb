class Queue
	# FIFO - First in, first out
	def initialize 
		@queue = []
		@min = nil
	end

	def add(item)
		@queue.push(item)
	end 

	def remove
		@queue.shift
	end 

	def peek
		@queue[0]
	end 

	def is_empty?
		@queue.length == 0 ? true : false
	end

	def update_min(item)
		@min = item unless @min 
		@min = item if item < @min
	end 

	
end