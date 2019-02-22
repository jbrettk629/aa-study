class Node 
	attr_accessor :next, :previous
	attr_reader :value

	def initialize(value)
		@value = value
	end
end

class LinkedList 
	 
		def initialize
			@head = nil
			@tail = nil
			@count = 0
		end 

		def append(value)
			if @head == nil
				new_node = Node.new(value)
				@head = new_node
				@tail = new_node
			else
				current = @head
				new_node = Node.new(value)
				current.last = new_node
				new_node.next = current
				@head = new_node
			end 
			@count += 1
		end
			
		def append_after(target, value)
			node = find(target)
			next_node = node.next
			new_node = Node.new(value)
			node.next, new_node.previous = new_node, node
			new_node.next, next_node.previous = next_node, new_node
			@count += 1
		end

		def delete
			current = @head
			current.next.previous = nil
			@head = current.next
			@count -= 1
		end

		def delete_target(target)
			node = find(target)
			node.previous.next = node.next
			node.next.previous = node.previous unless node.next == nil
			@count -= 1
		end

		def return_list
			nodes = []
			current = @head
			while current.next != nil 
				nodes << current.value
				current = current.next
			end 
			nodes << current 
			print nodes
			nodes
		end 
	
end