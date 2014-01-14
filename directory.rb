

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

def list_student_names(stu_list)
	#stu_list.each_with_index do |student, i|
	#	puts "#{i+1} - #{student[:name]} (#{student[:cohort]} cohort)"
	#end
	i = 0
	while i < stu_list.length 
		puts "#{i+1} - #{stu_list[i][:name]} (#{stu_list[i][:cohort]} cohort)"
		i += 1
	end 
end

def list_A_names(stu_list)
	list_student_names(stu_list.select { |name| name.slice(0) == "A" })
end

def list_12(stu_list)
	list_student_names(stu_list.select { |name| name.length < 12 })
end

def enter_student_details(stu_list)
	print "Please enter a name: "
	name = gets.chomp

	while !name.empty?
		print "Please enter your cohort: "
		cohort = gets.chomp

		cohort = "Jan" if cohort.empty?

		stu_list << { :name => name, :cohort => cohort.to_sym}

		#stu_list.push(name)
		if stu_list.length == 1
			puts "So far we have #{stu_list.length} student"
		else
			puts "So far we have #{stu_list.length} students"
		end

		print "Please enter a name: "
		name = gets.chomp
	end
	return stu_list
end


def list_by_cohort(stu_list)

	# gets similar cohorts - removes duplicate values & creates an array containing unique values
	sorted = stu_list.sort {|one, another| one[:cohort] <=> another[:cohort]}
	list_student_names(sorted)

	#cohort_list = stu_list.map { |student| student[:cohort]}.uniq	#[jan, feb]
	#i = 0
	#while i < stu_list.length #[4]
		# get list of users starting from a particular cohort
	#	 list_student_names(stu_list.select { |field| field[:cohort] == cohort_list[i] })
	# 	i += 1
	# end
end

def interactive_menu
	students = []
	loop do
		# Print Menu For The User
		puts "---------------------"
		puts "1. Input the Students"
		puts "2. Show the Students"
		puts "9. Exit"
		puts "---------------------"

		# User Choice
		selected = gets.chomp

		# Do What User Asked
		case selected
		when "1"
			enter_student_details(students)
		when "2"
			print_header
			list_student_names(students)
		when "9"
			exit
		else
			puts "\nWRONG INPUT. Please, Try Again!\n"
		end
	end
end

interactive_menu


# using the methods
# print_header
# #input_student_name(students)
# #print_student_length(students)
# #list_12(students)
# enter_student_details(students)
# # list_A_names(students)
# puts list_by_cohort(students)
# #list_student_names(students)

