#!/usr/bin/env ruby
	


def input_students

	puts "First name?".ljust(0)

	students = []
	#get the first name
	name = gets.chomp
	name.capitalize!
	puts "cohort?".ljust(0)
	month = gets.chomp.upcase!

	while !name.empty? && !month.empty? do 
		students << {:name => name, :cohort => month}
			if students.count > 1
			puts "Now there are #{students.length} students!".center(100)
			
			else
			puts "Now there is #{students.length} student".center(100)
		
			end
		puts "First name?".ljust(0)
		name = gets.chomp
		name.capitalize!
		puts "cohort?".ljust(0)
		month = gets.chomp.upcase!
	end
	students
end

def user_choice
	puts "Which cohort do you want to see?"
	choice = gets.chomp.upcase!


end

def print_header(students, cohorts)
	
		puts "The students of the #{cohorts} cohort at Makers Academy".center(100) if students.count > 1
		puts "The student of the #{cohorts} cohort at Makers Academy".center(100) if students.count == 1
		puts "There are no students (sad face)!".center(100) if students.count.zero?
		puts "___________________________________________".center(100)
end

def output(students, cohorts)

	#puts students
 	sorted_by_cohort=students.sort {|student, cohort| student[:cohort]<=>student[:name]}
 	x = sorted_by_cohort.select{ |student, cohort| student[:cohort] == cohorts}.map{|student, cohort| student[:name]}
 	puts x

end

def print_footer(names, cohorts)
   number = names.count{|student| student[:cohort] == cohorts}
 
    puts "Hey why don't you enroll?".center(100) if names.count.zero? 
    puts "there is a student! yay!".center(100) if names.count == 1
    puts "we have #{number} students in this cohort.".center(100) if names.count > 1

end

students = input_students
cohorts = user_choice
print_header(students,cohorts)
output(students,cohorts)
print_footer(students,cohorts)
