# frozen_string_literal: true

require './functions'
require './menu'
# App class
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts 'Welcome to the school library app!'
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
        list_all_books(@books)
      when 2
        list_all_people(@people)
      when 3
        print 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
        person_type = gets.chomp.to_i
        case person_type
        when 1
          print 'Age: '
          age = gets.chomp.to_i
          print 'Name: '
          name = gets.chomp
          print 'Has parent permission? [Y/N]: '
          permission = gets.chomp
          if %w[y Y].include?(permission)
            create_student(age, name, true, @people)
          elsif %w[n N].include?(permission)
            create_student(age, name, false, @people)
          else
            puts 'Invalid choice. Please try again.'
          end
        when 2
          print 'Age: '
          age = gets.chomp.to_i
          print 'Name: '
          name = gets.chomp
          print 'Specialization: '
          specialization = gets.chomp
          # Create the teacher
          create_teacher(age, name, specialization, @people)
        else
          puts 'Invalid choice. Please try again.'
        end
      when 4
        print 'Title: '
        title = gets.chomp
        print 'Author: '
        author = gets.chomp
        create_book(title, author, @books)
        puts 'Book created successfully'
      when 5
        puts 'Select a book from the following list by number'
        @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
        book = gets.chomp.to_i
        puts 'Select a person from the following list by number (not id)'
        @people.each_with_index do |person, index|
          puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person = gets.chomp.to_i
        print 'Date: '
        date = gets.chomp
        create_rental(@people[person], @books[book], date, @rentals)
        puts 'Rental created successfully'
      when 6
        puts 'ID of person:'
        person_id = gets.chomp
        list_rentals_by_id(person_id, @rentals)
      when 7
        puts 'Thank you for using this app!'
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end
end
