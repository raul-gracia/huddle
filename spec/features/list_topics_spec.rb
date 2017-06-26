require 'rails_helper'

feature "ListTopics" do
  scenario "a list of topics is shown" do
    visit topics_path

    expect(page).to have_content('Topics')
  end
end
