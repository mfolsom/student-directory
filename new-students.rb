#!/usr/bin/env ruby

def input_students

	print "First name?\n"

	#empty array
	students = []
	#get the first name
	name = gets.chomp
	name.capitalize!
	print "cohort?\n"
	month = gets.chomp
	month.upcase!

	while !name.empty? && !month.empty? do 
		students << {:name => name, :cohort => month}
		print "Now we have #{students.length} students\n"
		print "First name?\n"
		name = gets.chomp
		name.capitalize!
			print "cohort?\n"
			month = gets.chomp
			month.upcase!
	end
	students
end

def print_header
print "The students of my cohort at Makers Academy\n"
print "___________________________________________\n"
end

#def output(students)
#students.each_with_index do |student, i|
#	print "#{i+1}:#{student[:name]} (#{student[:cohort]} cohort)\n"
#end
#end
	@filtered_list = []
def filter_students(students)

	students.each do |student|

		if student[:name].length <= 12
			@filtered_list << {student => :name, student=> :cohort}
			puts "#{student[:name]}:#{student[:cohort]}"
		end
	end
end

def print_footer(names)
#print final count
print "overall we have #{names.length} students.\n"
end

students = input_students
print_header
#output(students)
filter_students(students)
print_footer(@filtered_list)
