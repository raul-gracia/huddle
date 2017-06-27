require 'rails_helper'

feature "show a list of events in homepage" do
  background do
  end

  scenario "a logged out user visit the home page" do
    visit root_path

    expect(page).to have_css('h1', text: 'Events')
  end
end
