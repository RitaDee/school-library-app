require_relative '../classroom'

describe Classroom do
  context 'create a classroom' do
    classroom = Classroom.new('ruby language')

    it 'show classroom' do
      expect(classroom.label).to eq 'ruby language'
    end
  end
end

describe '#Create test for add_student method' do
  before :each do
    @classroom = Classroom.new 'Data Structure'
  end
  it 'Should return two student' do
    # create two students
    marc = Student.new(2, 'Marc', 16, false)
    rita = Student.new(3, 'Rita', 16, false)

    # add the students to the classroom
    @classroom.add_student(marc)
    @classroom.add_student(rita)
  end

  it 'Should return the classroom of the student' do
    marc = Student.new(2, 'Marc', 23, true)
    @classroom.add_student(marc)
    expect(marc.classroom).to eql @classroom
  end
end
