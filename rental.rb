class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    unless book.rentals.include?(self)
      book.rentals.push(self)
    end

    @person = person
    unless person.rentals.include?(self)
      person.rentals.push(self)
    end
  end
end
