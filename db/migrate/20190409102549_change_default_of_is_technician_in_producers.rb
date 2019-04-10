class ChangeDefaultOfIsTechnicianInProducers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :producers, :is_technician, false
  end
end
