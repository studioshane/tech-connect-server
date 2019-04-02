class ChangeDefaultValuesForDisciplinesInTechnicians < ActiveRecord::Migration[5.2]
  def change
    change_column_default :technicians, :audio, false
    change_column_default :technicians, :video, false
    change_column_default :technicians, :lighting, false
    change_column_default :technicians, :general, false
  end
end
