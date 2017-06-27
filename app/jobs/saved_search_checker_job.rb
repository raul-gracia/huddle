class SavedSearchCheckerJob < ApplicationJob
  queue_as :default

  def perform(event)
    SavedSearch.all.each do |search|
      if event.city == search.city &&
          event.start_time >= search.start_time &&
          event.end_time <= search.end_time &&
          event.topic_ids.include?(search.topic_ids)
        EventMatchMailer.event_match(event, search).deliver_now
      end
    end
  end
end
