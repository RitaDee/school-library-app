require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('CS', 30, 'John Doe')
  end
end
