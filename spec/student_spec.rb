require './student'
require_relative '../rental'

describe Student do
  before(:each) do
    @parent_permission = true
    @student = Student.new(1, 'John', 16, @parent_permission)
  end

  context 'creating a student' do
    it 'returns the student age' do
      expect(@student.age).to eq 16
    end

    it 'returns the student name' do
      expect(@student.name).to eq 'John'
    end

    it 'returns true for can_use_services? when the student has parent permission' do
      expect(@student.can_use_services?).to eq true
    end

    it 'returns false for can_use_services? when the student does not have parent permission and is underage' do
      student = Student.new(2, 'Jane', 16, false)
      expect(student.can_use_services?).to eq false
    end

    it 'returns true for can_use_services? when the student is of age and does not have parent permission' do
      student = Student.new(3, 'Mike', 18, false)
      expect(student.can_use_services?).to eq true
    end
  end

  context 'miscellaneous' do
    it 'returns a shrug emoji when the student plays hooky' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end

    it 'notifies upon student creation' do
      expect { Student.new(5, 'Alice', 17, @parent_permission) }.to output("Student Alice enrolled\n").to_stdout
    end
  end
end
