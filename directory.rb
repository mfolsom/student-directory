#list all the students in an array
students = ["Bugs Bunny", "Road Runner", "Coyote", "Daffy Duck", "Donald Duck","The Abominable Snowman"]

#print them
puts "The students of my cohort at Makers Academy"
puts "___________________________________________"

students.each do |student|
	puts student
end

#print final count
puts "overall we have #{students.length} students."
