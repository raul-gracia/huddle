require 'rails_helper'

describe Topic do

  describe 'has db structure' do
    it { should have_db_column(:name) }
  end

  describe 'has validations' do
    it { should validate_uniqueness_of(:name) }
  end

  describe 'has relationships' do
    it { should have_and_belong_to_many(:events) }
  end
end
