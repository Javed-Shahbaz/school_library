require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end

  def ad_rent(rent)
    @rentals.push(rent)
    rent.person = self
  end
end
