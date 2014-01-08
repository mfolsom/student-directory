#!/usr/bin/env ruby

def input_students
	print "Please enter the names of the students"
    print "To finish, just hit return twice"

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
print "___________________________________________"
end

def print(students)
students.each do |student|
	print "#{student[:name]} (#{student[:cohort]} cohort)\n"
end

end

def print_footer(names)
#print final count
print "overall we have #{names.length} students.\n"
end

students = input_students
print_header
print(students)
print_footer(students)
