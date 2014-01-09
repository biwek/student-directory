
# an array of student names using hashes
stu_names = [
			{:name => "Biwek Shrestha", :cohort => :january},
			{:name => "Nabin", :cohort => :january},
			{:name => "James", :cohort => :january},
			{:name => "Andrey", :cohort => :january}
			]

# prints headers
def print_header
	puts "----------------"
	puts "List of students"
	puts "----------------"
end

# using iteration
def print_student_names(stu_list)
	stu_list.each do |name|
		puts "#{name[:name]}  (#{name[:cohort]} cohort)"
	end
end


# prints the number of students
def print_student_length(stu_list)
	puts "Overall, there are #{stu_list.length} students"
end

# using the methods
print_header
print_student_names(stu_names)
print_student_length(stu_names)

