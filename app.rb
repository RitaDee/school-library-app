require './book'
require './person'
require './decorator'
require './rental'
require './student'
require './teacher'
require './classroom'

class App
  def initialize
    @classroom = []
    @book = []
    @rental = []
    @people = []
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]'
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2' then create_teacher
    else
      puts 'invalid input'
      nil
    end
  end

  def create_student(name, age)
    print 'Classroom: '
    classroom_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    classroom = Classroom.new(classroom_name)
    student = Student.new(classroom, age, name, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully'
  end

  def create_teacher
    id = @people.length + 1
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(id, age, name, specialization)
    add_person(teacher)
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    add_book(book)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }
    person_index = gets.chomp.to_i

    puts 'Date:'
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
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
