class SavedSearch < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :topics

  validates_presence_of :name, :city, :start_time, :end_time, :user_id

  def self.from_params(params)
    search = params[:search]
    if search
      start_time = Time.parse("#{search['start_time(4i)']}:#{search['start_time(5i)']}")
      end_time = Time.parse("#{search['end_time(4i)']}:#{search['end_time(5i)']}")
      new(city: search["city"], topic_ids: search["topics"], start_time: start_time, end_time: end_time)
    else
      new(city: '', start_time: '00:00', end_time: '23:45', topics: [])
    end
  end

  def start_time_formatted
    start_time.strftime('%T')
  rescue
    nil
  end

  def end_time_formatted
    end_time.strftime('%T')
  rescue
    nil
  end
end
