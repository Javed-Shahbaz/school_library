class Rental
  attr_accessor :date, :person, :books

  def initialize(date, person, books)
    @date = date
    @person = person
    @book = books
    books.rentals << self
    person.rentals << self
  end
end
