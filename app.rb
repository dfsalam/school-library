class App
  def start
    puts <<~MENU
      Welcome to the school library app!
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit
    MENU
  end
end

app = App.new
app.start