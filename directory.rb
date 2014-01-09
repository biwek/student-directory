

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
	stu_list.each_with_index do |student, i|
		puts "#{i+1} - #{student[:name]} (#{student[:cohort]} cohort)"
	end
	#i = 0
	#while i < stu_list.length 
	#	puts "#{i+1} - #{stu_list[i]}"
	#	i += 1
	#end 
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

		stu_list << { :name => name, :cohort => cohort.to_sym}

		#stu_list.push(name)
		puts "So far we have #{stu_list.length} students"
		print "Please enter a name: "
		name = gets.chomp
	end
	return stu_list
end



# using the methods
print_header
#input_student_name(students)
#print_student_length(students)
#list_12(students)
#list_A_names(students)
enter_student_details(students)
list_student_names(students)

