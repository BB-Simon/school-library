require_relative 'app'

def main(options)
  app = App.new

  loop do
    option_menu
    option = gets.chomp.to_i
    if option == 7
      puts 'Exiting...'
      break
    elsif options[option]
      options[option].call(app)
    else
      puts 'Invalid option'
    end
  end
end

def option_menu
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person id'
  puts '7. Exit'
end

def handle_books_list(app)
  app.books_list
end

def handle_people_list(app)
  app.people_list
end

def handle_add_new_person(app)
  app.add_new_person
end

def handle_add_new_book(app)
  app.add_new_book
end

def handle_add_new_rental(app)
  app.add_new_rental
end

def handle_rentals_list(app)
  app.rentals_list
end

options = {
  1 => method(:handle_books_list),
  2 => method(:handle_people_list),
  3 => method(:handle_add_new_person),
  4 => method(:handle_add_new_book),
  5 => method(:handle_add_new_rental),
  6 => method(:handle_rentals_list)
}

main(options)
