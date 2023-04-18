# frozen_string_literal: true

require './functions'
require './menu'
# App class
class App
  def initialize
    @m = Menu.new
    @books = @m.books
    @people = @m.people
    @rentals = @m.rentals
  end

  def run
    puts 'Welcome to the school library app!'
    loop do
      option = @m.inicial_menu
      if option == 7
        puts 'Thank you for using this app!'
        break
      end
      switch_case(option)
    end
  end

  def switch_case(option)
    case option
    when 1 then @m.option1(@books)
    when 2 then @m.option2(@people)
    when 3 then @m.option3
    when 4 then @m.option4
    when 5 then @m.option5
    when 6 then @m.option6
    else
      puts 'Invalid choice. Please try again.'
    end
  end
end
