class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :producer_id
      t.string :client
      t.string :venue
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :techs_required

      t.timestamps
    end
  end
end
