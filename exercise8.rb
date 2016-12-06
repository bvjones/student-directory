def print_header
  puts "The students of Villains Academy".center(40)
  puts "-----------------".center(40)
end

def print(students)
  students.each_with_index do |student, x|
    puts "#{x}: #{student[:name]} (#{student[:cohort]} cohort) (Favorite hobby: #{student[:hobby]}) (from: #{student[:birthplace]}) (height :#{student[:height]})".center(40)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(40)
end

def input_students
  puts "Please enter the names of the students".center(40)
  puts "To finish, just hit return twice".center(40)

  #empty array
  students = []
  name = gets.chomp

  puts "Please enter #{name}'s cohort"
  cohort = gets.chomp

  puts "Please enter #{name}'s favorite hobby"
  hobby = gets.chomp

  puts "Please enter #{name}'s country of birth"
  birthplace = gets.chomp

  puts "Finally please enter #{name}'s height"
  height = gets.chomp

  while !name.empty? do
    #adding the student hash to array
    students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
    puts "Now we have #{students.count} students".center(40)
    name = gets.chomp
  end
  # returning the array
  students
end

def search_students(students)
  puts "Please enter the first letter of the student you would like to search for"
  search_letter = gets.chomp.capitalize
  search_student_letter =  students.select { |student| student[:name][0] == search_letter}

  puts "Here are the students begining with: #{search_letter}"

  search_student_letter.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
  end
end

def student_name_length(students)
  puts "We have removed all of the students with less than 12 characters in their names".center(40)
  student_length = students.select { |student| student[:name].length < 12 }
# loop for the amount of students in the array
  student_length.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    puts "---------------".center(40)
  end
end

#calling methods
students = input_students
print_header
search_students(students)
student_name_length(students)
print_header
print(students)
print_footer(students)
