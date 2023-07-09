require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def ad_rental(rent)
    @rentals.push(rent)
    rent.book = self
  end
end
