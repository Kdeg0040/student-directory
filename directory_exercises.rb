# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: "hobby", birth_country: "country", height: "height"}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  index = 0
  while index < students.size
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    puts "hobbies: #{students[index][:hobbies]}"
    puts "country of birth: #{students[index][:birth_country]}"
    puts "height(cm): #{students[index][:height]}"
    index += 1
  end
end

def print_starting_with(letter, students)
  students.each do |student|
    if student[:name].chr == letter
      puts student[:name]
    end
  end
end

def print_shorter_than(num, students)
  students.each do |student|
    if student[:name].size < num
      puts student[:name]
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
