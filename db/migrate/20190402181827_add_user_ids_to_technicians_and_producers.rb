class AddUserIdsToTechniciansAndProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :technicians, :user_id, :integer
    add_column :producers, :user_id, :integer
  end
end
