require './book'
require './person'
require './decorator'
require './rental'
require './student'
require './teacher'
require './classroom'
require './data/load'

require 'json'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      interface_menu
      option = gets.chomp
      if option == '7'
        puts 'Thank you for using the Library App!'
        break
      end
      option_selector(option)
    end
  end

  def list_books
    @load = Load.new
    @load.load_books
    if @load.books.empty?
      puts 'There are no books in the library'
    else
      @load.books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}".capitalize
      end
    end
  end

  def list_people
    @load = Load.new
    @load.load_people

    if @load.people.empty?
      puts 'There are no people in the library'
    else
      @load.people.each do |person|
        if person.is_a?(Teacher) && person.specialization
          puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age},
           Specialization: #{person.specialization}"
        else
          puts "[Student] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        end
      end
    end
  end

  def list_rentals_person
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }
    person_index = gets.chomp.to_i
    show_rentals_person(person_index)
  end

  def show_rentals_person(person_index)
    puts "#{@people[person_index].name} has rented the following books:"
    @people[person_index].rentals.map do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'That is not a valid input'
      nil
    end
  end

  def create_student
    id = @people.length + 1
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Has parent permission? [Y/N]?'
    permission = gets.chomp
    if permission.match?(/y/i)
      parent_permission = true
    elsif permission.match?(/n/i)
      parent_permission = false
    else
      puts 'That is not a valid input'
      return
    end
    student = Student.new(id, age, name, parent_permission)
    @people << student
    save = []
    if File.exist?('./data/people.json')
      # Read existing data from file
      file = File.read('./data/people.json')
      save = JSON.parse(file)
      add_person(student)
    end
    save << { id: student.id, name: student.name, age: student.age }
    File.write('./data/people.json', JSON.pretty_generate(save))
    puts 'Student created successfully'
  end

  def create_teacher
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    add_person(teacher)
    @people << teacher
    save = []

    if File.exist?('./data/people.json')
      # Read existing data from file
      file = File.read('./data/people.json')
      save = JSON.parse(file)
    end

    # Append new teacher data to the array
    save << { id: teacher.id, name: teacher.name, age: teacher.age, specialization: teacher.specialization }

    # Write the updated array to the file
    File.write('./data/people.json', JSON.generate(save))

    puts 'Teacher created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    add_book(book)

    books_data = []
    books_data = JSON.parse(File.read('./data/books.json')) if File.exist?('./data/books.json')

    # Append new book to existing data
    books_data << { title: title, author: author }

    # Write combined data back to file
    File.write('./data/books.json', JSON.pretty_generate(books_data))

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}" }
    book_index = gets.chomp.to_i

    if book_index.negative? || book_index >= @books.length
      puts 'Invalid book selection'
      return
    end

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }
    person_index = gets.chomp.to_i

    if person_index.negative? || person_index >= @people.length
      puts 'Invalid person selection'
      return
    end

    puts 'Date:'
    date = gets.chomp

    book = @books[book_index]
    puts "Selected book: #{book.title} by #{book.author}"

    rental = Rental.new(date, book, @people[person_index])
    add_rental(rental)
  end

  private

  def add_person(person)
    @people << person
  end

  def add_book(book)
    @books << book
  end

  def add_rental(rental)
    @rentals << rental
  end

  def option_selector(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_person
    else
      puts 'That is not a valid input'
    end
  end

  def interface_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
