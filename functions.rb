# frozen_string_literal: true

require './student'
require './teacher'
require './rental'
require './book'

# This class represents functions inside menu
class Functions
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def create_student(age, name, permission, id = 'empty')
    student = Student.new(age, name)
    student.parent_permission = permission
    @people.push(student)
    student.id = id if id != 'empty'
    puts 'Person created successfully'
  end

  def create_teacher(age, name, specialization, id = 'empty')
    teacher = Teacher.new(age, name, specialization)
    @people.push(teacher)
    teacher.id = id if id != 'empty'
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
      array.each do |person|
        puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" unless person.nil?
      end
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

  def load_data
    people_json = 'people.json'
    # books_json = 'books.json'
    # rentals_json = 'rentals.json'
    return unless File.exist?(people_json)

    people_data = JSON.parse(File.read(people_json))
    people_data.each do |person|
      load_person(person)
    end
  end

  def load_person(person)
    if person['Type'] == 'Student'
      student = create_student(person['Age'], person['Name'], person['Permission'], person['ID'])
      @people.push(student)
    elsif person['Type'] == 'Teacher'
      teacher = create_teacher(person['Age'], person['Name'], person['Specialization'], person['ID'])
      @people.push(teacher)
    end
  end

  def save_data
    # construct a json
    people_json = []
    temp = {}
    @people.each do |person|
      next if person.nil?

      temp = { Type: person.class.name, Name: person.name, ID: person.id, Age: person.age,
               Permission: person.parent_permission }
      temp[:Specialization] = person.specialization if person.instance_of?(::Teacher)
      people_json.push(temp)
    end
    File.write('people.json', JSON.generate(people_json))
  end
end
