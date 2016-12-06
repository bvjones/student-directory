def print_header
  puts "The students of Villains Academy".center(40)
  puts "-----------------".center(40)
end

def print(students)
  students.each_with_index do |student, x|
    puts "#{x}: #{student[:name]} (#{student[:cohort]} cohort)".center(40)
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

  while !name.empty? do
    #adding the student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students".center(40)
    name = gets.chomp
  end
  # returning the array
  students
end

def search_students(students)
  puts "Please enter the first letter of the student you would like to search for"
  search_letter = gets.chomp.capitalize
  search_students =  students.select { |student| student[:name][0] == search_letter}

  puts "Here are the students begining with: #{search_letter}"

  search_students.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end

end

#calling methods
students = input_students
print_header
search_students(students)
print(students)
print_footer(students)
