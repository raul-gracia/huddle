require 'rails_helper'

describe SavedSearch do
  describe 'has db structure' do
    it { should have_db_column(:name) }
    it { should have_db_column(:city) }
    it { should have_db_column(:start_time) }
    it { should have_db_column(:end_time) }
    it { should have_db_column(:user_id) }
  end

  describe 'has validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'has relationships' do
    it { should have_and_belong_to_many(:topics) }
  end

  describe '.from_params' do
    context 'when no params' do
      it 'initiliazes a new saved search with defaults' do
        params = {}
        search = SavedSearch.from_params(params)

        expect(search.city).to eq ''
        expect(search.start_time_formatted).to eq '00:00:00'
        expect(search.end_time_formatted).to eq '23:45:00'
        expect(search.topic_ids).to eq []
      end
    end

    context 'with correct search params' do
      before do
        3.times do |i|
          Topic.create!(id: i+1, name: "Topic ##{i+1}")
        end
      end
      it 'should initialize a new saved search with correct values' do
        params = {search: {
            'city'           => 'Barcelona',
            'start_time(4i)' => '19',
            'start_time(5i)' => '00',
            'end_time(4i)'   => '22',
            'end_time(5i)'   => '00',
            'topics'         => [1,2,3]
          }
        }
        search = SavedSearch.from_params(params)

        expect(search.city).to eq 'Barcelona'
        expect(search.start_time_formatted).to eq '19:00:00'
        expect(search.end_time_formatted).to eq '22:00:00'
        expect(search.topic_ids).to eq [1, 2, 3]

      end
    end
  end
end
