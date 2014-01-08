#!/usr/bin/env ruby

def input_students

	puts "First name?".ljust(0)

	#empty array
	students = []
	#get the first name
	name = gets.chomp
	name.capitalize!
	puts "cohort?".ljust(0)
	month = gets.chomp
	month.upcase!

	while !name.empty? && !month.empty? do 
		students << {:name => name, :cohort => month}
		puts "Now we have #{students.length} students".center(100)
		puts "First name?".ljust(0)
		name = gets.chomp
		name.capitalize!
			puts "cohort?".ljust(0)
			month = gets.chomp
			month.upcase!
	end
	students
end

def print_header
puts "The students of my cohort at Makers Academy".center(100)
puts "___________________________________________".center(100)
end

def output(students)
students.each_with_index do |student, i|
	puts "#{i+1} : #{student[:name]} (#{student[:cohort]} cohort)".center(100)
end
end
# @filtered_list = []
# def filter_students(students)

# 	students.each do |student|

# 		if student[:name].length <= 12
# 			@filtered_list << {student => :name, student=> :cohort}
# 			puts "#{student[:name]}:#{student[:cohort]}".center(100)
# 		end
# 	end
# end

def print_footer(names)
#print final count
puts "overall we have #{names.length} students.".center(100)
end

students = input_students
print_header
output(students)
#filter_students(students)
print_footer(students)
