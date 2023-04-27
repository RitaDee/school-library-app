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

  context 'when can_use_service? method is called' do
    it 'return true or false' do
      expect(@teacher.can_use_services?).not_to be false
    end
  end
end
