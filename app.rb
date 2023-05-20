require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def books_list
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def people_list
    @people.each do |person|
      type = '[Student]' if person.is_a?(Student)
      type = '[Teacher]' if person.is_a?(Teacher)
      puts "#{type} Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def add_new_student
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Has parent permission? [Y/N]: '
    has_parent_permission = gets.chomp == 'Y'
    student = Student.new(age, nil, name: name, parent_permission: has_parent_permission)
    @people << student
    puts 'Student added successfully'
  end

  def add_new_teacher
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Specialization: '
    specialization = gets.chomp
    puts 'Name:'
    name = gets.chomp
    has_parent_permission = true
    teacher = Teacher.new(age, specialization, name: name, parent_permission: has_parent_permission)
    @people << teacher
    puts 'Teacher added successfully'
  end

  def add_new_person
    puts 'Do you want to create a student (1) or teacher (2) [Input the number]:'
    option = gets.chomp.to_i
    if option == 1
      add_new_student
    elsif option == 2
      add_new_teacher
    else
      puts 'Invalid option'
    end
  end

  def add_new_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book added successfully'
  end

  def add_new_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    selected_book = @books[book_index]
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
    person_index = gets.chomp.to_i
    selected_person = @people[person_index]
    puts 'Date: '
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_person)
    @rentals << rental
    puts 'Rental added successfully'
  end

  def rentals_list
    puts 'Enter person id: '
    id = gets.chomp.to_i
    person_rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    person_rentals.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}"
    end
  end
end
