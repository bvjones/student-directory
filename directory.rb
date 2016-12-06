#adding students to an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bathes"
]

#prints each line from the array using it's index
students.each do |student|
  puts student
end

puts "Overall, we have #{students.count} great students"
