# Preview all emails at http://localhost:3000/rails/mailers/event_match
class EventMatchPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_match/event_match
  def event_match
    EventMatchMailer.event_match(Event.last, SavedSearch.last)
  end

end
