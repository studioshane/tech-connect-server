class RemoveProducerIdFromEventTeches < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_teches, :producer_id
  end
end
