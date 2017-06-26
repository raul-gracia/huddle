require 'rails_helper'

describe Event do
  describe 'has db structure' do
    it { should have_db_column(:name) }
    it { should have_db_column(:date) }
    it { should have_db_column(:start_time) }
    it { should have_db_column(:end_time) }
    it { should have_db_column(:address) }
    it { should have_db_column(:city) }
    it { should have_db_column(:postcode) }
    it { should have_db_column(:country) }
  end

  describe 'has validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:postcode) }
    it { should validate_presence_of(:country) }
  end

  describe 'has relationships' do
    it { should have_and_belong_to_many(:topics) }
  end


  describe '#full_address' do
    it 'returns the address, city, postcode and country together' do
      event = Event.new(address: 'address, 23', city: 'Madrid', postcode: '1234', country: 'Spain')

      expect(event.full_address).to eq 'address, 23, 1234, Madrid, Spain'
    end
  end
end
