require './student'
require './teacher'
require './books'
require './rent'

class App
  def initialize(parent)
    @parent = parent
    @books_list = []
    @people_list = []
    @rents_list = []
  end

  def list_all_books
    if @books_list.empty?
      puts 'No Book Found!'
    else
      puts 'Books Available in the library'
      @books_list.each { |books| puts "Title: #{books.title}, Author: #{books.author}" }
    end
    @parent.show_menu
  end

  def list_all_people
    if @people_list.empty?
      puts 'No Person Found!'
    else
      puts 'People in the library'
      @people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    @parent.show_menu
  end

  def create_person
    print 'Do 'You Want to Create a Student(1) or a Teacher(2)? [Input the number]: '
    person_role = gets.chomp
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please Enter a valid Number!'
    end
    @parent.show_menu
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has Parent Permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    @people_list.push(Student.new(age, name, parent_permission: parent_permission))
    puts
    puts 'Student Created Successfuly'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people_list.push(Teacher.new(age, specialization, name))
    puts
    puts 'Teacher Created Successfuly'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books_list.push(Book.new(title, author))
    puts 'Add Book successfully'
    @parent.show_menu
  end

  def create_rent
    puts 'Select a book from list by number'
    @books_list.each_with_index { |books, index| puts "#{index}) Title: '#{books.title}', Author: #{books.author}" }
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rents_list.push(rent.new(date, @books_list[book_num], @people_list[person_num]))
    puts 'Rent Created Successfully'
    @parent.show_menu
  end

  def list_all_rents
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'rents:'
    @rents_list.each do |rent|
      puts "Date: #{rent.date}, Book \"#{rent.books.title}\" by #{rent.books.author}" if rent.person.id == id
    end
    @parent.show_menu
  end

  def exit
    puts 'Thanks for Using Library App.'
  end
end
