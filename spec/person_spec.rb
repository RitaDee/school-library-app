require './person'

describe Person do
  context 'creating a person' do
    before(:each) do
      @person = Person.new(1, 'Microverse', 27)
    end

    it 'returns the person age' do
      expect(@person.age).to eq 27
    end

    it 'returns the person name' do
      expect(@person.name).to eq 'Microverse'
    end

    it 'returns false when the person does not have parent permission and is underage' do
      person = Person.new(2, 'James', 16, parent_permission: false)
      expect(person.can_use_services?).to eq false
    end

    it 'returns true when the person does not have parent permission and is of age' do
      person = Person.new(3, 'James', 21, parent_permission: false)
      expect(person.can_use_services?).to eq true
    end

    it 'returns true when the person has parent permission' do
      person = Person.new(4, 'James', 26, parent_permission: true)
      expect(person.can_use_services?).to eq true
    end
  end
end
