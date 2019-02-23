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

		def remove_dups
      values = Hash.new(0)
      current_node = @head
      while current_node
        puts values
        if values[current_node.value] == 0
          values[current_node.value] = 1
          current_node = current_node.next
        else
          last_node = current_node.previous
          next_node = current_node.next
          last_node.next = next_node
          next_node.previous = last_node unless next_node == nil
          current_node = next_node
        end
      end
      return @head
    end

    def remove_dups_with_runner
      current_node = @head
      while current_node
        runner = current_node
        while (runner && runner.next)
          if runner.next.value == current_node.value
            runner.next.next.previous = runner unless runner.next.next == nil
            runner.next = runner.next.next
          end
          runner = runner.next
        end
        current_node = current_node.next
      end
    end

    def partition(value)
      
    end
	
end