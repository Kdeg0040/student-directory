# let's put all students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # get the first names
  name = gets.sub(/\n/, "")
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort: "
    cohort = gets.chomp.to_sym
    cohort = "---" if cohort.empty?

    puts "Hobbies: "
    hobbies = gets.chomp
    hobbies = "---" if hobbies.empty?

    puts "Country of birth: "
    birth_country = gets.chomp
    birth_country = "---" if birth_country.empty?

    puts "Height(cm): "
    height = gets.chomp
    height = "---" if height.empty?

    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, birth_country: birth_country, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def puts_center(text)
  puts text.center(40)
end

def print_header
  puts_center("The students of Villains Academy")
  puts_center("-------------")
end

def print(students)
  index = 0
  while index < students.size
    puts_center("#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)")
    puts_center("hobbies: #{students[index][:hobbies]}")
    puts_center("country of birth: #{students[index][:birth_country]}")
    puts_center("height(cm): #{students[index][:height]}")
    puts ""
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

def print_by_cohort(students)
  list = []
  students.each {|i| list << i[:cohort]}

  index = 1
  list.sort.uniq!.each do |x|
    students.each do |i|
      if x == i[:cohort]
        puts_center("#{index}. #{i[:name]} (#{i[:cohort]} cohort)")
        puts_center("hobbies: #{i[:hobbies]}")
        puts_center("country of birth: #{i[:birth_country]}")
        puts_center("height(cm): #{i[:height]}")
        puts ""
        index += 1
      end
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts_center("Overall, we have #{students.count} great student")
  else
    puts_center("Overall, we have #{students.count} great students")
  end
end

def run_directory
  students = input_students
  #nothing happens until we call the methods
  if students.size > 0
    print_header
    print(students)
    print_footer(students)
  end
end

run_directory
