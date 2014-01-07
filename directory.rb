#!/usr/bin/env ruby
#list all the students in an array
students = [
	{:name => "Bugs Bunny", :cohort => :January},
	{:name => "Road Runner",:cohort => :November},
	{:name => "Coyote", :cohort => :January},
	{:name => "Daffy Duck", :cohort => :November},
	{:name => "Donald Duck", :cohort => :January},
	{:name => "The Abominable Snowman", :cohort => :January}
]
#print them
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

#call methods
print_header
print(students)
print_footer(students)

