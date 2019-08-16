
@students = [] # an empty array accessible to all methods
# let's put all students into an array

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first names
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Cohort: "
    cohort = STDIN.gets.chomp.to_sym
    cohort = "---" if cohort.empty?

    puts "Hobbies: "
    hobbies = STDIN.gets.chomp
    hobbies = "---" if hobbies.empty?

    puts "Country of birth: "
    birth_country = STDIN.gets.chomp
    birth_country = "---" if birth_country.empty?

    puts "Height(cm): "
    height = STDIN.gets.chomp
    height = "---" if height.empty?

    # add the student hash to the array
    @students << {name: name, cohort: cohort, hobbies: hobbies, birth_country: birth_country, height: height}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def puts_center(text)
  puts text.center(40)
end

def print_header
  puts_center("The students of Villains Academy")
  puts_center("-------------")
end

def print_student_list
  index = 0
  while index < @students.size
    puts_center("#{index + 1}. #{@students[index][:name]} (#{@students[index][:cohort]} cohort)")
    puts_center("hobbies: #{@students[index][:hobbies]}")
    puts_center("country of birth: #{@students[index][:birth_country]}")
    puts_center("height(cm): #{@students[index][:height]}")
    puts ""
    index += 1
  end
end

def print_starting_with(letter)
  @students.each do |student|
    if student[:name].chr == letter
      puts student[:name]
    end
  end
end

def print_shorter_than(num)
  @students.each do |student|
    if student[:name].size < num
      puts student[:name]
    end
  end
end

def print_by_cohort
  list = []
  @students.each {|i| list << i[:cohort]}

  index = 1
  list.sort.uniq!.each do |x|
    @students.each do |i|
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

def print_footer
  if @students.count == 1
    puts_center("Overall, we have #{@students.count} great student")
    puts ""
  else
    puts_center("Overall, we have #{@students.count} great students")
    puts ""
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:birth_country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobbies, birth_country, height = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, birth_country: birth_country, height: height}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def run_directory
  interactive_menu
  #nothing happens until we call the methods
  if @students.size > 0
    print_header
    print_student_list
    print_footer
  end
end

try_load_students
interactive_menu
