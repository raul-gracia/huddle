class EventMatchMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_match_mailer.event_match.subject
  #
  def event_match(event, search)
    @event = event
    @user = search.user
    @search = search

    mail to: @user.email
  end
end
