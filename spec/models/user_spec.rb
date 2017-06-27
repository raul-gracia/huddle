require 'rails_helper'

describe User do
  describe 'has db structure' do
    it { should have_db_column(:name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
  end

  describe 'has validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
  end

  describe 'has relationships' do
    it { should have_many(:saved_searches) }
  end
end
