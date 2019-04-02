class CreateEventTeches < ActiveRecord::Migration[5.2]
  def change
    create_table :event_teches do |t|
      t.integer :producer_id
      t.integer :technician_id

      t.timestamps
    end
  end
end
