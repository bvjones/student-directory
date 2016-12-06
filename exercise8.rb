def interactive_menu
  students = []
  loop do
    puts "Please select one of the following -"
    puts "1. Input students"
    puts "2. Read and Save"
    puts "9. Exit"

    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again"
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-----------------".center(40)
end

def print(students)
  students.each_with_index do |student, i|
    puts "Here's our list of students - "
    puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort) (Favorite hobby: #{student[:hobby]}) (from: #{student[:birthplace]}) (height :#{student[:height]})"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students

  cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #empty array
  students = []
  name = gets.gsub("\n", "")

  while !name.empty? do
      puts "Please enter #{name}'s cohort"
      cohort = gets.gsub("\n", "")
      cohort.capitalize!
      cohort.to_sym
      if cohort == ""
        cohort = :January
      elsif cohorts.include?(cohort)
        cohort = cohort.to_sym
      end

      puts "Please enter #{name}'s favorite hobby"
      hobby = gets.gsub("\n", "")

      puts "Please enter #{name}'s country of birth"
      birthplace = gets.gsub("\n", "")

      puts "Finally please enter #{name}'s height"
      height = gets.gsub("\n", "")
      #adding the student hash to array
      students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
      if students.count < 2
      puts "Now we have #{students.count} student"
      else
      puts "Now we have #{students.count} students"
      end
      puts "Please enter the name of the next student"
      puts "Press return twice if you don't wish to continue"
    name = gets.gsub("\n", "")
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
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def student_name_length(students)
  puts "We have removed all of the students with less than 12 characters in their names"
  student_length = students.select { |student| student[:name].length < 12 }
  student_length.each_with_index do |student, i|
    puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort) (Favorite hobby: #{student[:hobby]}) (from: #{student[:birthplace]}) (height :#{student[:height]})"
  end
end

def list_by_cohort(students)
  students_by_cohort = students.select { |student| student[:cohort] ==
    "January" }

  puts "Here are all the students listed on the January cohort -"

  students_by_cohort.each_with_index do |student, i|
    puts "#{i+1}.#{student[:name]}"
  end
end

def no_students(students)
  if students.empty?
    puts "Before coninuing please enter students details"
    input_students
  else
    print(students)
  end
end
#calling methods
interactive_menu
# students = input_students
# print_header
# search_students(students)
# puts "-" * 8
# student_name_length(students)
# puts "-" * 8
# list_by_cohort(students)
# puts "-" * 8
# no_students(students)
# print_footer(students)
