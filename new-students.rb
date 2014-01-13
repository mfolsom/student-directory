#!/usr/bin/env ruby
@students = []

def print_menu
	puts "1. Input the students."
	puts "2. Show the students."
	puts "3. Save the students to a file."
	puts "9. Exit"
end

def show_students
	print_header
	print_student_list
	print_footer
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			input_cohorts
			show_students
		when "3"
			save_students
		when "9"
			exit
	else
		puts "I don't know what you meant, try again."
	end	
end

def interactive_menu
	loop do
		load_students
		print_menu
		process(gets.chomp)
	end
end

def input_students

	puts "First name?".ljust(0)

	#students = []
	name = gets.chomp
	name.capitalize!
	puts "cohort?".ljust(0,'***')
	month = gets.chomp.upcase!
	

	while !name.empty? && !month.empty? do 
		@students << {:name => name, :cohort => month}
		student_counts = " Now there are #{@students.length} students! ".center(100, '%')
        one_student = " Now there is #{@students.length} student ".center(100, '%')
		puts(@students.length > 1 ? student_counts : one_student)
		puts "First name?".ljust(0)
		name = gets.chomp
		name.capitalize!
		puts "cohort?".ljust(0)
		month = gets.chomp.upcase!
	end
	@students
end

	def input_cohorts
		puts "Which cohort do you want to see?"
		@cohorts = gets.chomp.upcase!
		@cohorts
	end

def print_header
	
	puts " The students of the #{@cohorts} cohort at Makers Academy ".center(100,'*') if @students.count > 1
	puts " The student of the #{@cohorts} cohort at Makers Academy ".center(100,'*') if @students.count == 1
	puts " There are no students (sad face)! ".center(100,'*') if @students.count.zero?
	puts "___________________________________________".center(100)
end

def print_student_list
 	sorted_by_cohort=@students.sort {|student, cohort| student[:cohort]<=>student[:name]}
 	x = sorted_by_cohort.select{ |student, cohort| student[:cohort] == @cohorts}.map{|student, cohort| student[:name]}
 	puts x
end

def print_footer
   number = @students.count{|student| student[:cohort] == @cohorts}
   no_names = " Hey why don't you enroll? ".center(100,'+')
   one_name = " there is a student! yay! ".center(100, '+')
   several_names = " we have #{number} students in this cohort. ".center(100,'+')
   puts(@students.count.zero? ? no_names : @students.count ==1 ? one_name : several_names)

end

def save_students
	# open the file for writing
	file = File.open("students.csv", "a")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(',')
		file.puts csv_line
	end
	file.close
	puts "Students saved!"
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort}
	end
	file.close
end

interactive_menu





































