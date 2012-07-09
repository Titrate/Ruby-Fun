require 'contact.rb'
require 'node.rb'

dan = Contact.new("Dan", "Guimares", "112", "abc@123.com", 35)
chad = Contact.new("Chad", "Simmons", "112", "abd@123.com")
britt = Contact.new


#This is an implicit call to to_s
puts dan

#This is an explicit calll to to_s
chad_str = chad.to_s
puts chad_str

#First print defualt britt config
puts britt

#update contact britt
britt.firstName="Britt"
britt.lastName="Christy"
britt.phone="1123123"
britt.email="iambruitto"

#Print britt after fields have been updated
puts britt

top = Node.new
current = top
newNode = Node.new

top.data = britt
newNode.data = dan
top.next = newNode
top.prev = newNode
newNode.next = top
newNode.prev = top

current = current.next

newNode = Node.new

newNode.data = chad
newNode.prev = current
newNode.next = current.next
current.next = newNode
newNode.next.prev = newNode

current = top

for i in 1..3
	puts current.data
	current = current.next
end
