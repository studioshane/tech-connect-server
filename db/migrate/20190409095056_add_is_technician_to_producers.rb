class AddIsTechnicianToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :is_technician, :boolean, default: :false
  end
end
