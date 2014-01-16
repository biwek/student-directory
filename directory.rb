
@students = []

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
def print_student_length
	puts "Overall, there are #{@students.length} students"
end

def list_student_names
	#stu_list.each_with_index do |student, i|
	#	puts "#{i+1} - #{student[:name]} (#{student[:cohort]} cohort)"
	#end
	i = 0
	while i < @students.length 
		puts "#{i+1} - #{@students[i][:name]} (#{@students[i][:cohort]} cohort)"
		i += 1
	end 
end

def list_A_names(stu_list)
	list_student_names(stu_list.select { |name| name.slice(0) == "A" })
end

def list_12(stu_list)
	list_student_names(stu_list.select { |name| name.length < 12 })
end

def enter_student_details
	print "Please enter a name: "
	name = gets.chomp

	while !name.empty?
		print "Please enter your cohort: "
		cohort = gets.chomp

		cohort = "Jan" if cohort.empty?

		@students << { :name => name, :cohort => cohort.to_sym}

		#stu_list.push(name)
		if @students.length == 1
			puts "So far we have #{@students.length} student"
		else
			puts "So far we have #{@students.length} students"
		end

		print "Please enter a name: "
		name = gets.chomp
	end
	return @students
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

def print_menu
	puts "---------------------"
	puts "1. Input the Students"
	puts "2. Show the Students"
	puts "3. Save student to CSV file"
	puts "9. Exit"
	puts "---------------------"
end

def show_students
	print_header
	list_student_names
	print_student_length
end

def process(selected)
	case selected
		when "1"
			enter_student_details
		when "2"
			show_students
		when "3"
			save_students
		when "9"
			exit
		else
			puts "\nWRONG INPUT. Please, Try Again!\n"
	end
end

def interactive_menu
	loop do
		# Print Menu For The User
		print_menu

		# User Chooses and Do What The User Asked
		process(gets.chomp)
		
	end
end

def save_students
	# Open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

interactive_menu



