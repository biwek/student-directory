
# an array of student names using hashes
stu_names = [
			{:name => "Biwek Shrestha", :cohort => :january},
			{:name => "Nabin", :cohort => :january},
			{:name => "James", :cohort => :january},
			{:name => "Andrey", :cohort => :january}
			]

students = []

# prints headers
def print_header
	puts "----------------"
	puts "List of students"
	puts "----------------"
end

# using iteration
def input_student_name(stu_list)
	puts "Please enter a name:"
	puts "Enter twice to exit the program"
	name = gets.chomp
	while !name.empty?
		stu_list.push(name)
		puts "So far we have #{stu_list.length} students"
		name = gets.chomp
	end
	return stu_list
end


# prints the number of students
def print_student_length(stu_list)
	puts "Overall, there are #{stu_list.length} students"
end

# using the methods
print_header
input_student_name(students)
print_student_length(students)

