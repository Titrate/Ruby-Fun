class Contact
	
	#This is a getter, notice the @ to denote the variable belongs to the class
	#the method is called fname
	#def fname
	#	@fname
	#end

	#simiarly, this is a setter, the method name is not setfname, it is fname=
	#def fname=(fname)
	#	@fname=fname
	#end
	#
	#There is a better way to do this in ruby. Ruby will take care of getter/setters for you.
	
	#note the lack of an id, id will be a static class var
	attr_accessor :firstName, :lastName, :phone, :email

	#Now to declare our static class var, note the double @
	@@id = 1

	#Now we need initializers (like a constructor)
	#This is our defualt (empty initializer)
	#All initalizers are run in order, look below to see how to handle making an empty
	#contact. We must provide default values to the params
	#def initialize
	#	@id = @@id
	#	@@id += 1
	#end

	#Ruby files are exectued from top to bottom. If you have two initializers, both will
	#get executed on creation. If they have different parameter reqs one of the two will
	#fail.
	def initialize(fname="New", lname="Contact", phone="123", email="abv", id = @@id)
		@firstName = fname
		@lastName = lname
		@phone = phone
		@email = email
		if (id > @@id)
			@id = id
			@@id = id + 1
		elsif (id < @@id)
			@id = id
		else
			@id = @@id
			@@id += 1
		end
	end

	#Now lets just make a fun to string method, it must be called to_s
	#note the lack of return statement, in ruby, the last line is always returned
	def to_s
		@firstName + ":" + @lastName + ":" + @phone + ":" + @email + ":" + @id.to_s
	end
end
