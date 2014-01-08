#!/usr/bin/env ruby

def input_students

	print "Please enter the names of the students\n"
	print "To finish, just hit return twice\n"

	#empty array
	students = []
	#get the first name
	name = gets.chomp

	while !name.empty? do 
		students << {:name => name, :cohort => :january}
		print "Now we have #{students.length} students\n"
		name = gets.chomp
	end
	students
end

def print_header
print "The students of my cohort at Makers Academy\n"
print "___________________________________________\n"
end

def output(students)
students.each_with_index do |student, i|
	print "#{i+1}:#{student[:name]} (#{student[:cohort]} cohort)\n"
end

end

def print_footer(names)
#print final count
print "overall we have #{names.length} students.\n"
end

students = input_students
print_header
output(students)
print_footer(students)