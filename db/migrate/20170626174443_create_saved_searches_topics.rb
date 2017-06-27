class CreateSavedSearchesTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_searches_topics do |t|
      t.references :saved_search, foreign_key: true
      t.references :topic, foreign_key: true
    end
  end
end
