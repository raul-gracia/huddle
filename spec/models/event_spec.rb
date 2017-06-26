require 'rails_helper'

describe Event do
  describe 'has db structure' do
    it { should have_db_column(:name) }
    it { should have_db_column(:date) }
    it { should have_db_column(:start_time) }
    it { should have_db_column(:end_time) }
    it { should have_db_column(:place) }
  end

  describe 'has validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
    it { should validate_presence_of(:place) }
  end

  describe 'has relationships' do
    it { should have_and_belong_to_many(:topics) }
  end
end
