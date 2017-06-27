class Event < ApplicationRecord
  has_and_belongs_to_many :topics

  validates_presence_of :name, :date, :start_time, :end_time, :address, :city, :postcode, :country

  def full_address
    [address, postcode, city, country].join(', ')
  end

  def self.filter_results(saved_search)
    results = self.left_joins(:topics).includes(:topics)
      .where('start_time >= ? AND end_time <= ?', saved_search.start_time_formatted, saved_search.end_time_formatted)
      .distinct

    results = results.where(topics: {id: saved_search.topic_ids}) if saved_search.topics.any?
    results = results.where('city = ?', saved_search.city) if saved_search.city.present?
    results
  end
end
