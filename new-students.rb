#!/usr/bin/env ruby

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	#empty array
	students = []
	#get the first name
	name = gets.chomp

	while !name.empty? do 
		students << {:name => name, :cohort => :january}
		puts "Now we have #{students.length} students"
		name = gets.chomp
	end
	students
end

def print_header
puts "The students of my cohort at Makers Academy"
puts "___________________________________________"
end

def print(students)
students.each do |student|
	puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer(names)
#print final count
puts "overall we have #{names.length} students."
end

students = input_students
print_header
print(students)
print_footer(students)
