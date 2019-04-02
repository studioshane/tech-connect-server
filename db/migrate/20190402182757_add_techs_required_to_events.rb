class AddTechsRequiredToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :techs_required, :integer
  end
end
