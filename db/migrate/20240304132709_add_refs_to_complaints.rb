class AddRefsToComplaints < ActiveRecord::Migration[7.1]
  def change
    add_reference :complaints, :complaint_type, null: false, foreign_key: true
    add_reference :complaints, :type_specification, null: false, foreign_key: true
    add_reference :complaints, :user, null: false, foreign_key: true
  end
end
