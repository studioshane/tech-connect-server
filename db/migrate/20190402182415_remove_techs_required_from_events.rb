class RemoveTechsRequiredFromEvents < ActiveRecord::Migration[5.2]
  def change
     remove_column :events, :techs_required
  end
end
