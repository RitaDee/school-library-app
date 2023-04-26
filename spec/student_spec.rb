# require './student'

# describe Student do
#   before(:each) do
#     @parent_permission = true
#     @student = Student.new(1, 16, 'John', @parent_permission)
#   end

#   context 'creating a student' do
#     it 'returns the student age' do
#       expect(@student.age).to eq 16
#     end

#     it 'returns the student name' do
#       expect(@student.name).to eq 'John'
#     end

#     it 'returns true for can_use_services? when the student has parent permission' do
#       expect(@student.can_use_services?).to eq true
#     end

#     it 'returns false for can_use_services? when the student does not have parent permission and is underage' do
#       student = Student.new(2, 16, 'Jane', false)
#       expect(student.can_use_services?).to eq false
#     end

#     it 'returns true for can_use_services? when the student is of age and does not have parent permission' do
#       student = Student.new(3, 18, 'Mike', false)
#       expect(student.can_use_services?).to eq true
#     end
#   end

#   context 'managing rentals' do
#     before(:each) do
#       @book = Book.new('Title', 'Author')
#       @rental = Rental.new(@book, @student)
#     end

#     it 'allows a student to rent a book' do
#       expect(@student.rentals).to include(@rental)
#       expect(@book.is_available?).to eq false
#     end

#     it 'allows a student to return a rented book' do
#       @student.return_book(@book)
#       expect(@student.rentals).not_to include(@rental)
#       expect(@book.is_available?).to eq true
#     end

#     it 'raises an error when a student tries to return a book they have not rented' do
#       book2 = Book.new('Another Title', 'Another Author')
#       expect { @student.return_book(book2) }.to raise_error('This student did not rent this book')
#     end
#   end

#   context 'classroom' do
#     it 'adds the student to the classroom if a classroom is provided' do
#       classroom = Classroom.new('History')
#       student = Student.new(4, 16, 'Sarah', @parent_permission, classroom)
#       expect(classroom.students).to include(student)
#     end
#   end

#   context 'miscellaneous' do
#     it 'returns a shrug emoji when the student plays hooky' do
#       expect(@student.play_hooky).to eq '¯\(ツ)/¯'
#     end

#     it 'notifies upon student creation' do
#       expect { Student.new(5, 17, 'Alice', @parent_permission) }.to output("Student Alice enrolled\n").to_stdout
#     end
#   end
# end
