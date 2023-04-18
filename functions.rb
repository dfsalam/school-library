# frozen_string_literal: true

require './student'
require './teacher'
require './rental'
require './book'
class Functions
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def create_student(age, name, permission)
    student = Student.new(age, name)
    student.parent_permission = permission
    @people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def create_rental(person, book, date)
    rental = Rental.new(person, book, date)
    @rentals.push(rental)
  end

  def list_all_people(array)
    if array.empty?
      puts 'No people found.'
    else
      array.each { |person| puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def list_all_books(array)
    if array.empty?
      puts 'No books found.'
    else
      array.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_rentals_by_id(person_id, array)
    selected = array.select { |rental| rental.person.id == person_id }
    puts 'Rentals:'
    selected.each { |rental| puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
  end
end
