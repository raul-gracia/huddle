class Topic < ApplicationRecord
  validates_uniqueness_of :name

  has_and_belongs_to_many :events
  has_and_belongs_to_many :saved_searches
end
