class Event < ApplicationRecord
  has_and_belongs_to_many :topics

  validates_presence_of :name, :date, :start_time, :end_time, :address, :city, :postcode, :country

  def full_address
    [address, postcode, city, country].join(', ')
  end

  def self.filter_results(params)
    self.all.where('city = ? AND start_time >= ? AND end_time <= ?', params[:city], params[:start_time].strftime('%T'), params[:end_time].strftime('%T'))
  end
end
