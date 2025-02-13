require 'peep'

describe Peep do 
  describe '.all' do
    it 'returns all created peeps' do
      user = User.create(username: 'test1', email: 'test@email.com', password: 'testpassword1')
      peep = Peep.create(username: 'test1', peep: 'Hello World')
      Peep.create(username: 'test1', peep: 'Ruby')
      Peep.create(username: 'test1', peep: 'Code')
    
      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq 'Hello World'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(username: 'test1', email: 'test@email.com', password: 'testpassword1')
      peep = Peep.create(username: 'test1', peep: 'Hello World')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id =#{peep.id};")
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'Hello World'
    end
    it 'creates a new peep that has the username of the maker' do
      user = User.create(username: 'test1', email: 'test@email.com', password: 'testpassword1')
      peep = Peep.create(username: 'test1', peep: 'Hello World')

      expect(peep.username).to eq "test1"
    end
  end

end 
