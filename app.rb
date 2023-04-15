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
      option = inicial_menu
      if option == 7
        puts 'Thank you for using this app!'
        break
      end
      swith_case(option)
    end
  end
end

def swith_case(option)
  case option
  when 1 then list_all_books(@books)
  when 2 then list_all_people(@people)
  when 3 then option3
  when 4 then option4
  when 5 then option5
  when 6 then option6
  else
    puts 'Invalid choice. Please try again.'
  end
end
