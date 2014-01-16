#!/usr/bin/env ruby
class StudentDirectory


	def initialize # called when we do StudentDirectory.new
		@students = []
	end


	def interactive_menu
		try_load_students
		loop do
			print_menu
			process(STDIN.gets.chomp)
		end
	end

	## MENU Part ##
	def print_menu
		puts "1. Input the students."
		puts "2. Show the students."
		puts "3. Save the students to a file."
		puts "4. Load the students"
		puts "9. Exit"
	end

	def process(selection)		
		case selection
			when "1"
				input_students
			when "2"
				input_cohorts
				@students = []
				try_load_students
				show_students
			when "3"
				save_students
			when "4"
				save_or_not
			when "9"				
				exit
		else
			puts "I don't know what you meant, try again."
		end	
	end
	## END of Menu Part ##


	## Inputting of students happen here ##
	def input_name_and_cohort
		puts "First name?"
		@name = STDIN.gets.chomp
		@name.capitalize!
		puts "cohort?"
		@month = STDIN.gets.chomp.upcase!


	end


	def input_students
	input_name_and_cohort

		while !@name.empty? && !@month.empty? do 
			@students << {:name => @name, :cohort => @month}
			student_counts = " Now there are #{@students.length} students! ".center(100, '%')
	        one_student = " Now there is #{@students.length} student ".center(100, '%')
			puts(@students.length > 1 ? student_counts : one_student)
			input_name_and_cohort
		end
		save_or_not
		@students

	end

	def input_cohorts

		puts "Which cohort do you want to see?"
		@cohorts = STDIN.gets.chomp.upcase!
		@cohorts

	end
	## END of inputting ##

	## Show Students Part ##
	def show_students
		print_header
		print_student_list
		print_footer
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
	##  END OF Show Students Part ##

	## LOADING AND SAVING Part ##
	def save_students
		# open the file for writing
	    filename=ARGV.first
		file = File.open(filename, "w")
		# iterate over the array of students
		@students.each do |student|
			student_data = [student[:name], student[:cohort]]
			csv_line = student_data.join(',')
			file.puts csv_line
		end
		file.close
		puts "Students saved!"
	end

	def save_or_not
		puts "Would you like to save the students you entered? (yes/no)"
		save = STDIN.gets.chomp
		case save
		when "yes"
			save_students
			@students = []
			try_load_students
		when "no"
	      @students = []
	      try_load_students
	    end
		end


	def load_students(filename = "students.csv")
		file = File.open(filename, "r")
		file.readlines.each do |line|
			name, cohort = line.chomp.split(',')
			@students << {:name => name, :cohort => cohort}
		end
		file.close
	end

	def try_load_students
		filename=ARGV.first
		return if filename.nil?
		if File.exists?(filename)
			load_students(filename)
			puts "Loaded #{ARGF.argv[0]}"
		else 
			puts "Sorry #{filename} doesn't exist"
			exit
		end
	end

	## END OF LOADING AND SAVING Part ##
end




