require './student.rb'
require './teacher.rb'
require './rental.rb'
require './book.rb'

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
        list_all_books
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
        print "Title: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
        create_book(title, author)
        puts "Book created successfully"
        
      when 5
        puts "Select a book from the following list by number"
        @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
        book = gets.chomp.to_i
        puts "Select a person from the following list by number (not id)"
        @people.each_with_index { |person, index| puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
        person = gets.chomp.to_i
        print "Date: "
        date = gets.chomp
        create_rental(@people[person], @books[book], date)
        puts "Rental created successfully"
      when 6
        puts "You selected option 6 - List all rentals for a given person id"
        
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
    student.parent_permission = permission
    @people.push(student)
    puts "Person created successfully"
  end
  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts "Person created successfully"
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(person, book, date)
    rental = Rental.new(person, book, date)
    @rentals.push(rental)
  end

  def list_all_people
    if @people.empty?
      puts "No people found."
    else
      @people.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_all_books
    if @books.empty?
      puts "No books found."
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
