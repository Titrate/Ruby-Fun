#addBook.rb

#We need the following two files
require 'node.rb'

#Here is the actual class definition
class AddBook
	attr_accessor :top, :current

	@@count = 0

	def initialize
		@top = nil
		@current = nil
	end


	#We need a method for retieving the count
	def count
		@@count
	end

	#Remeber, there are two cases in a circular linked list, empty and not empty
	#if a location for insert is not given, assume insert is after current
	#NOTE: empty if @@count == 0 else non empty
	def add(data)
		newNode = Node.new
		newNode.data = data
		
		if @@count == 0
			@top = newNode #there are no nodes so top becomes newNode
			@top.next = @top #Since only one node, top points to itself
			@top.prev = @top #Same as above only the other direction
		else #Now we have nodes
			newNode.next = @current.next #First we sent new's next to current's next
			newNode.prev = @current			 #Then we set new's prev to current
			@current.next = newNode			 #Now we set current's next to new
			newNode.next.prev = newNode #Finally we set new's next's prev to new
		end

		#The last thing we want to do is set current to the new node and update our count
		@current = newNode
		@@count += 1
	end

	#To really test this code we need a few more methods.
	#First prev and next to really test that everything so far is working
	def next
		@current = @current.next
	end
	
	def prev
		@current = @current.prev
	end

	#To make life a little esaier, we will make a retieve method for gaining 
	#access to @current's data
	#NOTE: Notice the if statement. In ruby, only false and nil eval to false
	#EVERYTIHNG else evalutes to true, even 0
	def data_current
		if @current
			@current.data
		else
			'List is empty, no data to print'
		end
	end

	def data_top
		if @top 
			@top.data
		else
			'List is empty, no data to print'
		end
	end

	#Now a remove method because it is silly without the ability to remove something
	def remove
		#Balls! I really don't want to write this again.
		#Okay, 3 cases, empty, 1 contact, and not empty
		#First case, empty
		if @@count == 0
			puts 'Nothing to remove'
		#Second case, 1 contact, just make everything nil
		elsif @@count == 1
			@current = nil
			@top = nil
			@@count -= 1
		#Third case, more than 1 entry
		else
			#Check to see if removing top, move it forward if removing top
			if @current == @top
				@top = @top.next
			end
			#update pointers
			@current.next.prev = @current.prev
			@current.prev.next = @current.next
			@current = @current.next
			#decrement count
			@@count -= 1
		end
	end
end

