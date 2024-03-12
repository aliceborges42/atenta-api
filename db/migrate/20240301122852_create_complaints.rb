class CreateComplaints < ActiveRecord::Migration[7.1]
  def change
    create_table :complaints do |t|
      t.text :description
      t.string :status
      t.float :latitude
      t.float :longitude
      t.time :hour
      t.date :date

      t.timestamps
    end
  end
end
