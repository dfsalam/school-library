require './student.rb'
require './teacher.rb'
require './rental.rb'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end
  def run
    puts "Welcome to the school library app!"
    loop do
      puts <<~MENU
        Please choose an option:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit
      MENU

      option = gets.chomp.to_i

      case option
      when 1
        list_all_people
      when 2
        list_all_people
      when 3
        print "Do you want to create a student(1) or a teacher(2)? [Input the number]:"
        person_type = gets.chomp.to_i
        case person_type
        when 1
          print "Age: "
          age = gets.chomp.to_i
          print "Name: "
          name = gets.chomp
          print "Has parent permission? [Y/N]: "
          permission = gets.chomp
          if permission == "y" || permission == "Y"            
            #Create the student
            create_student(age, name, true)
          elsif permission == "n" || permission == "N"
            parent_permission = false
            #Create the student
            create_student(age, name, false)
          else
            puts "Invalid choice. Please try again."            
          end         
        when 2
          print "Age: "
          age = gets.chomp.to_i
          print "Name: "
          name = gets.chomp
          print "Specialization: "
          specialization = gets.chomp
          #Create the teacher
          create_teacher(age, name, specialization)
        else
          puts "Invalid choice. Please try again."
        end
          

      when 4
        puts "You selected option 4 - Create a book"
        # Code for option 4
      when 5
        puts "You selected option 5 - Create a rental"
        # Code for option 5
      when 6
        puts "You selected option 6 - List all rentals for a given person id"
        # Code for option 6
      when 7
        puts "Thank you for using this app!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
  #Run method end here

  def create_student(age, name, permission)
    student = Student.new(age, name)
    @people.push(student)
    puts "Person created successfully"
  end
  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts "Person created successfully"
  end
  def list_all_people
    if @people.empty?
      puts "No people found."
    else
      @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end
end
