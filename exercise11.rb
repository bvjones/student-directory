@students = []

def initialize_students(name, cohort, hobby, birthplace, height)
      @students << {name: name, cohort: cohort, hobby: hobby, birthplace: birthplace, height: height}
end

def save_students
    puts "Please enter a filename to save the students to -"
    filename = gets.chomp
    CSV.open(filename, "w")
    @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:birthplace], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = "students.csv"
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  puts "Please enter a filename to load the students to..."
  filename = gets.chomp
  file = CSV.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby, birthplace, height = line.chomp.split(',')
  initialize_students(name, cohort, hobby, birthplace, height)
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
    case selection
    when "1"
      puts "You selected #{selection}."
      puts "Entering student information..."
      students = input_students
    when "2"
      "You selected #{selection}."
      puts "Here's a list of students..."
      show_students
    when "3"
      puts "You selected #{selection}."
      puts "Saving students to file..."
      save_students
    when "4"
      puts "You selected #{selection}."
      puts "Loading students from file..."
      load_students
    when "9"
      puts "You selected #{selection}."
      puts "Exiting program..."
      exit
    else
      puts "I don't know what you mean, please try again"
    end
end

def print_menu
    puts "Executable file: #{$0}"
    puts "Please select one of the following -"
    puts "1. Input students"
    puts "2. Read and Save"
    puts "3. Save the list to file"
    puts "4. Load the list from file"
    puts "9. Exit"
  end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(40)
  puts "-----------------".center(40)
end

def print_students_list()
  @students.each_with_index do |student, i|
        puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort) (Favorite hobby: #{student[:hobby]}) (from: #{student[:birthplace]}) (height :#{student[:height]})"
  end
end

def print_footer()
  puts "Overall, we have #{@students.count} great students"
end

def input_students

  cohorts = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #empty array
  name = STDIN.gets.gsub("\n", "")

  while !name.empty? do
      puts "Please enter #{name}'s cohort"
      cohort = STDIN.gets.gsub("\n", "")
      cohort.capitalize!
      cohort.to_sym
      if cohort == ""
        cohort = :January
      elsif cohorts.include?(cohort)
        cohort = cohort.to_sym
      end

      puts "Please enter #{name}'s favorite hobby"
      hobby = STDIN.gets.gsub("\n", "")

      puts "Please enter #{name}'s country of birth"
      birthplace = STDIN.gets.gsub("\n", "")

      puts "Finally please enter #{name}'s height"
      height = STDIN.gets.gsub("\n", "")
      #adding the student hash to array

      initialize_students(name, cohort, hobby, birthplace, height)

      if @students.count < 2
      puts "Now we have #{@students.count} student"
      else
      puts "Now we have #{@students.count} students"
      end
      puts "Please enter the name of the next student"
      puts "Press return twice if you don't wish to continue"
    name = STDIN.gets.gsub("\n", "")
  end
  # returning the array
  @students
end

def search_students()
  puts "Please enter the first letter of the student you would like to search for"
  search_letter = STDIN.gets.chomp.capitalize
  search_student_letter =  @students.select { |student| student[:name][0] == search_letter}

  puts "Here are the students begining with: #{search_letter}"

  search_student_letter.each_with_index do |student, i|
    puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def student_name_length()
  puts "We have removed all of the students with less than 12 characters in their names"
  student_length = @students.select { |student| student[:name].length < 12 }
  student_length.each_with_index do |student, i|
    puts "#{i}: #{student[:name]} (#{student[:cohort]} cohort) (Favorite hobby: #{student[:hobby]}) (from: #{student[:birthplace]}) (height :#{student[:height]})"
  end
end

def list_by_cohort()
  students_by_cohort = @students.select { |student| student[:cohort] ==
    "January" }

  puts "Here are all the students listed on the January cohort -"

  students_by_cohort.each_with_index do |student, i|
    puts "#{i+1}.#{student[:name]}"
  end
end

def no_students()
  if @students.empty?
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
