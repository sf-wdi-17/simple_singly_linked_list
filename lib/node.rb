class Node
	attr_reader :value, :next

	def initialize(value)
		@value = value
	end

	def add(node)
		@next = node
	end
end
