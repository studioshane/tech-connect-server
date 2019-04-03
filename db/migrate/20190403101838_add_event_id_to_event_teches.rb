class AddEventIdToEventTeches < ActiveRecord::Migration[5.2]
  def change
        add_column :event_teches, :event_id, :integer

  end
end
