
@students = []

# prints headers
def print_header
	puts "----------------"
	puts "List of students"
	puts "----------------"
end

def add_student(name, cohort)
	@students << { :name => name, :cohort => cohort.to_sym}
end

# prints the number of students
def print_student_length
	puts "Overall, there are #{@students.length} students"
end

def list_student_names
	@students.each_with_index do |student, i|
		puts "#{i+1} - #{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def list_A_names
	list_student_names(@students.select { |name| name.slice(0) == "A" })
end

def list_12
	list_student_names(@students.select { |name| name.length < 12 })
end

def enter_student_details
	print "Please enter a name: "
	name = gets.chomp

	while !name.empty?
		print "Please enter your cohort: "
		cohort = gets.chomp

		cohort = "Jan" if cohort.empty?

		add_student(name, cohort)

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


def list_by_cohort
	# gets similar cohorts - removes duplicate values & creates an array containing unique values
	sorted = @students.sort {|one, another| one[:cohort] <=> another[:cohort]}
	list_student_names(sorted)
end

def print_menu
	puts "---------------------"
	puts "1. Input the Students"
	puts "2. Show the Students"
	puts "3. Save student to CSV file"
	puts "4. Load the list from students.csv"
	puts "5. Testing Branches"
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
		when "4"
			load_students
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
		process(STDIN.gets.chomp)
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

def load_students(filename="students.csv")

	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(",")
		add_student(name, cohort)
	end
	file.close
end

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} does NOT exist."
		Exit
	end
end

try_load_students
interactive_menu


