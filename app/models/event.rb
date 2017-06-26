class Event < ApplicationRecord
  has_and_belongs_to_many :topics

  validates_presence_of :name, :date, :start_time, :end_time, :place
end
