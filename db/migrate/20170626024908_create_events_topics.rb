class CreateEventsTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :events_topics, id:false do |t|
      t.belongs_to :event, index: true
      t.belongs_to :topic, index: true
    end
  end
end
