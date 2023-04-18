# frozen_string_literal: true

require './functions'

# This class represents the menu
class Menu
  attr_accessor :people, :books, :rentals

  def initialize
    @f = Functions.new
    @books = @f.books
    @people = @f.people
    @rentals = @f.rentals
  end

  def inicial_menu
    puts ['', 'Please choose an option by entering a number:']
    puts ['1 - List all books', '2 - List all people', '3 - Create a person']
    puts ['4 - Create a book', '5 - Create a rental', '6 - List all rental for a given person id']
    puts ['7 - Exit']
    gets.chomp.to_i
  end

  def option1(books)
    @f.list_all_books(books)
  end

  def option2(people)
    @f.list_all_people(people)
  end

  def option3
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    person_type = gets.chomp.to_i
    case person_type
    when 1 then option31
    when 2 then option32
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def option31
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    parent_permission = %w[y Y].include?(permission)
    @f.create_student(age, name, parent_permission) if %w[y Y n N].include?(permission)
  end

  def option32
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    # Create the teacher
    @f.create_teacher(age, name, specialization)
  end

  def option4
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @f.create_book(title, author)
    puts 'Book created successfully'
  end

  def option5
    puts 'Select a book from the following list by number'
    print_books
    book = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    option51
    person = gets.chomp.to_i
    ask_date(person, book)
  end

  def option51
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def print_books
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
  end

  def ask_date(person, book)
    print 'Date: '
    date = gets.chomp
    @f.create_rental(@people[person], @books[book], date)
    puts 'Rental created successfully'
  end

  def option6
    puts 'ID of person:'
    person_id = gets.chomp
    @f.list_rentals_by_id(person_id, @rentals)
  end

  def option7
    puts 'Thank you for using this app!'
  end
end
