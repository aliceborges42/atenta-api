class AddResolutionDateToComplaints < ActiveRecord::Migration[7.1]
  def change
    add_column :complaints, :resolution_date, :date
  end
end
