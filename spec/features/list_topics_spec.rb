require 'rails_helper'

feature "ListTopics" do
  scenario "a list of topics is shown" do
    visit topics_path

    expect(page).to have_css('h1', text: 'Topics')
  end
end
