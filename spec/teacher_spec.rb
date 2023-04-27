require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('CS', 30, 'John Doe')
  end

  context 'given arguments' do
    it 'instantiate an object ' do
      expect(@teacher).to be_instance_of(Teacher)
    end
  end
end
