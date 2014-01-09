
# an array of student names
stu_names = [
			"Biwek Shrestha",
			"Nabin",
			"James",
			"Andrey"
			]

# prints headers
puts "----------------"
puts "List of students"
puts "----------------"

# using iteration
stu_names.each do |name|
	puts name
end


#prints the number of students
puts "Overall, there are #{stu_names.length} students"