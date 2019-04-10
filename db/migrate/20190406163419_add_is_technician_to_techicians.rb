class AddIsTechnicianToTechicians < ActiveRecord::Migration[5.2]
  def change
    add_column :technicians, :is_technician, :boolean, default: true
  end
end
