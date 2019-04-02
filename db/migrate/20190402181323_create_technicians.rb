class CreateTechnicians < ActiveRecord::Migration[5.2]
  def change
    create_table :technicians do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :day_rate
      t.boolean :audio
      t.boolean :video
      t.boolean :lighting
      t.boolean :general

      t.timestamps
    end
  end
end
