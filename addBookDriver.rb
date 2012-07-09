#addBookDriver.rb

require 'addBook.rb'
require 'contact.rb'

myAddBook = AddBook.new
myContact = Contact.new


puts myAddBook.count.to_s

myAddBook.add myContact

myContact = Contact.new
myContact.firstName = "Britt"
myAddBook.add myContact


myContact = Contact.new
myContact.firstName = "Dan"
myAddBook.add myContact

for i in 1..3
	puts myAddBook.data_current
	myAddBook.next
end

for i in 1..3
	puts myAddBook.data_current
	myAddBook.prev
end

puts myAddBook.count.to_s


for i in 1..4
	puts myAddBook.data_current
	puts myAddBook.data_top
	myAddBook.remove
end
